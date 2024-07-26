import 'package:flutter/material.dart';
import 'package:pyramakers_task/features/core/constant/letter_clipper.dart';
import 'package:pyramakers_task/features/tracing/tracing_model.dart';
import 'package:pyramakers_task/features/tracing/tracing_painter.dart';
import 'package:pyramakers_task/features/core/constant/letter_paths.dart';
import 'package:provider/provider.dart';


class TracingCanvas extends StatelessWidget {
  final String letter;

  const TracingCanvas({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    return Consumer<TracingModel>(
      builder: (context, model, child) {
        return ClipPath(
          clipper: LetterClipper(letter),
          child: GestureDetector(
            onPanUpdate: (details) {
              Offset localPosition = details.localPosition;
              if (_isWithinLetterOutline(localPosition)) {
                model.addPoint(localPosition);
              }
            },
            onPanEnd: (details) {
              model.addPoint(null);
            },
            child: CustomPaint(
              size: const Size(300, 300),
              painter: TracingPainter(model.points, letter),
              child: Container(),
            ),
          ),
        );
      },
    );
  }

  bool _isWithinLetterOutline(Offset point) {
    Path path = LetterPaths.getPathForLetter(letter);
    return path.contains(point);
  }
}
