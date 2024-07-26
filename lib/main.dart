import 'package:flutter/material.dart';
import 'package:pyramakers_task/features/tracing/logic/tracing_cubit.dart';
import 'package:pyramakers_task/features/tracing/ui/tracing_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TracingCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TracingScreen(),
      ),
    );
  }
}

