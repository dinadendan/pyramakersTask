import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pyramakers_task/features/tracing/tracing_canvas.dart';
import 'package:pyramakers_task/features/tracing/tracing_model.dart';

class TracingScreen extends StatelessWidget {
  const TracingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alphabet Tracing'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              Provider.of<TracingModel>(context, listen: false).clearPoints();
            },
          ),
        ],
      ),
      body: const Center(
        child: TracingCanvas(letter: 'A'),
      ),
    );
  }
}
