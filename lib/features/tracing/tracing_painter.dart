import 'package:flutter/material.dart';
import 'package:pyramakers_task/features/core/constant/letter_paths.dart';

class TracingPainter extends CustomPainter {
  final List<Offset?> points;
  final String letter;

  TracingPainter(this.points, this.letter);

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the letter outline
    final outlinePaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0;

    Path path = LetterPaths.getPathForLetter(letter);
    final matrix = Matrix4.identity()
      ..translate(size.width / 2 - 150, size.height / 2 - 150)
      ..scale(size.width / 300.0, size.height / 300.0);
    path.transform(matrix.storage);
    canvas.drawPath(path, outlinePaint);

    // Draw the traced points
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
