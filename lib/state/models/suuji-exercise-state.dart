import 'package:nareru/state/age/age-exercise-state.dart';
import 'package:nareru/state/count/count-exercise-state.dart';
import 'package:nareru/state/jikan/jikan-exercise-state.dart';

// TODO: remove this file
class SuujiExerciseState {
  List<CountExerciseState> countExercises;
  List<AgeExerciseState> ageExercises;
  List<JikanExerciseState> jikanExercises;

  late List<dynamic> _all = [];

  SuujiExerciseState({
    required this.countExercises,
    required this.ageExercises,
    required this.jikanExercises,
  });

  List<dynamic> getAll() {
    if (_all.length > 0) return _all;

    _all.addAll(countExercises);
    _all.addAll(ageExercises);
    _all.addAll(jikanExercises);

    _all.shuffle();
    return _all;
  }
}
