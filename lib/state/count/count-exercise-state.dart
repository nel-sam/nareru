import 'package:flutter/material.dart';

class CountExerciseState {
  final IconData icon;
  final int count;
  final String correctAnswer;
  final String counter;
  String userInput = '';

  CountExerciseState({
    required this.icon,
    required this.count,
    required this.counter,
    required this.correctAnswer
  });
}


