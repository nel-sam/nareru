import 'package:flutter/material.dart';
import 'package:nareru/constants.dart';
import 'package:nareru/state/count/count-exercise-state.dart';

class CountGenerator {
  static createExercise(int index) {
    // TODO: Create new exercise every time
    return CountExerciseState(
        icon: Icons.person, count: 3, correctAnswer: 'さんにん', counter: '人');
  }

  static int getMaxIndex() {
    return COUNT_EXERCISE_COUNT;
  }
}
