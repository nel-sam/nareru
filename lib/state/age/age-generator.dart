import 'package:nareru/constants.dart';
import 'package:nareru/state/age/age-exercise-state.dart';

class AgeGenerator {
  static createExercise(int index) {
    return AgeExerciseState(age: 37, correctAnswer: 'さんじゅうななさい', counter: '歳');
  }

  static int getMaxIndex() {
    return AGE_EXERCISE_COUNT;
  }
}
