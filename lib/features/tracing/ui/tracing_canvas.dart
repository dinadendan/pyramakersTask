import 'package:flutter/material.dart';
import 'package:pyramakers_task/features/core/constant/letter_clipper.dart';
import 'package:pyramakers_task/features/tracing/logic/tracing_cubit.dart';
import 'package:pyramakers_task/features/tracing/logic/tracing_states.dart';
import 'package:pyramakers_task/features/tracing/ui/tracing_painter.dart';
import 'package:pyramakers_task/features/core/constant/letter_paths.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TracingCanvas extends StatelessWidget {
  final String letter;

  const TracingCanvas({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TracingCubit,TracingState>(
      builder: (context,state) {
        final cubit = context.read<TracingCubit>();
        return ClipPath(
          clipper: LetterClipper(letter),
          child: GestureDetector(
            onPanUpdate: (details) {
              Offset localPosition = details.localPosition;
              if (_isWithinLetterOutline(localPosition)) {
                cubit.addPoint(localPosition);
              }
            },
            onPanEnd: (details) {
              cubit.addPoint(null);
            },
            child: CustomPaint(
              size: const Size(300, 300),
              painter: TracingPainter(cubit.points, letter),
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
