import 'package:flutter/material.dart';

class LetterPaths {
  static Path getPathForLetter(String letter) {
    switch (letter) {
      case 'M':
        return _getPathForM();
      case 'A':
        return _getPathForA();

      default:
        return Path();
    }
  }

  static Path _getPathForM() {
    Path path = Path();
    path.moveTo(100, 300);  // Adjusted starting point
    path.lineTo(150, 100);
    path.lineTo(200, 250);
    path.lineTo(250, 100);
    path.lineTo(300, 300);
    return path;
  }

  static Path _getPathForA() {
    final path = Path();
    path.moveTo(100, 220); // Starting point
    path.lineTo(150, 50); // Top peak
    path.lineTo(200, 220); // Bottom right corner
    path.lineTo(170, 160); // Adjust horizontal bar start
    path.lineTo(130, 160);
    path.close();
    return path;
  }


}
