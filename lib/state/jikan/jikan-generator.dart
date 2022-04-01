import 'package:nareru/constants.dart';
import 'package:nareru/state/jikan/jikan-exercise-state.dart';

class JikanGenerator {
  static createExercise(int index) {
    return JikanExerciseState(
        hour: '05',
        min: '43',
        sec: '12',
        correctHour: 'ごじ',
        correctMin: 'よんじゅっさんぷん',
        correctSec: 'じゅうにびょう',
        hourState: true,
        minuteState: true,
        secondState: true);
  }

  static int getMaxIndex() {
    return JIKAN_EXERCISE_COUNT;
  }
}
