import 'package:flutter/material.dart';

class TracingModel with ChangeNotifier {
  List<Offset?> _points = [];

  List<Offset?> get points => _points;

  void addPoint(Offset? point) {
    _points.add(point);
    notifyListeners();
  }

  void clearPoints() {
    _points = [];
    notifyListeners();
  }
}
