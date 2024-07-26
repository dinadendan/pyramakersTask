import 'package:flutter/material.dart';
import 'package:pyramakers_task/features/core/constant/letter_paths.dart';

class LetterClipper extends CustomClipper<Path> {
  final String letter;

  LetterClipper(this.letter);

  @override
  Path getClip(Size size) {
    Path path = LetterPaths.getPathForLetter(letter);
    // Adjust path size and position according to the canvas size
    final matrix = Matrix4.identity()
      ..translate(size.width / 2 - 150, size.height / 2 - 150)
      ..scale(size.width / 300.0, size.height / 300.0); // Scale based on canvas size
    path.transform(matrix.storage);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
