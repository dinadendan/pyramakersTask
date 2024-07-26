import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramakers_task/features/tracing/logic/tracing_cubit.dart';
import 'package:pyramakers_task/features/tracing/logic/tracing_states.dart';
import 'package:pyramakers_task/features/tracing/ui/tracing_canvas.dart';

class TracingScreen extends StatelessWidget {
  const TracingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocBuilder<TracingCubit, TracingState>(
        builder: (context, state) {
          final cubit = context.read<TracingCubit>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Alphabet Tracing'),
              bottom: TabBar(
                onTap: (index) {
                  if (index == 0) {
                    cubit.changeLetter('M');
                  } else if (index == 1) {
                    cubit.changeLetter('A');
                  }
                },
                tabs: const [
                  Tab(text: 'Letter M'),
                  Tab(text: 'Letter A'),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    cubit.clearPoints();
                  },
                ),
              ],
            ),
            body: const TabBarView(
              physics: NeverScrollableScrollPhysics(),

              children: [
                Center(
                  child: TracingCanvas(letter: 'M'),
                ),
                Center(
                  child: TracingCanvas(letter: 'A'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
