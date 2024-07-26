import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramakers_task/features/tracing/logic/tracing_states.dart';

class TracingCubit extends Cubit<TracingState> {

  TracingCubit() : super(TracingStateInitial());

  List<Offset?> _points = [];

  List<Offset?> get points => _points;

  void addPoint(Offset? point) {
    _points.add(point);
    emit(TracingAddPoints());
  }

  void clearPoints() {
    _points = [];
    emit(TracingStateClearPoints());
  }

}

