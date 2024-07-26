import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pyramakers_task/features/tracing/tracing_model.dart';
import 'package:pyramakers_task/features/tracing/tracing_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TracingModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TracingScreen(),
      ),
    );
  }
}

