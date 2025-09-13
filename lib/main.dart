import 'package:flutter/material.dart';

import 'features/screens/workout_screen.dart';

void main() {
  runApp(const WorkoutPlannerApp());
}

class WorkoutPlannerApp extends StatelessWidget {
  const WorkoutPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Workout Planner",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F7),
      ),
      home: const WorkoutScreen(),
    );
  }
}
