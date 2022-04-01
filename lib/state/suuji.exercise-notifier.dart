// import 'package:flutter/material.dart';
// import 'package:nareru/state/age/age-exercise-state.dart';
// import 'package:nareru/state/count/count-exercise-state.dart';
// import 'package:nareru/state/jikan/jikan-exercise-state.dart';
// import 'package:nareru/state/models/suuji-exercise-state.dart';

// class SuujiExerciseNotifier with ChangeNotifier {
//   late SuujiExerciseState suujiExerciseState;
// // TODO: Remove file
//   SuujiExerciseNotifier() {
//     List<CountExerciseState> countExerciseState = [];

//     List<AgeExerciseState> ageExerciseState = [];

//     List<JikanExerciseState> jikanExerciseState = [
//       JikanExerciseState(
//           hour: '05',
//           min: '43',
//           sec: '12',
//           correctHour: 'ごじ',
//           correctMin: 'よんじゅっさんぷん',
//           correctSec: 'じゅうにびょう',
//           hourState: true,
//           minuteState: true,
//           secondState: true),
//       JikanExerciseState(
//           hour: '02',
//           min: '09',
//           sec: '08',
//           correctHour: 'にじ',
//           correctMin: 'きゅうふん',
//           correctSec: 'はちびょう',
//           hourState: true,
//           minuteState: true,
//           secondState: true)
//     ];

//     suujiExerciseState = SuujiExerciseState(
//       countExercises: countExerciseState,
//       ageExercises: ageExerciseState,
//       jikanExercises: jikanExerciseState,
//     );
//   }

//   onAgeSet(AgeExerciseState state, String userInput) {
//     state.userInput = userInput;
//     notifyListeners();
//   }

//   onUserCountSet(CountExerciseState state, String userInput) {
//     state.userInput = userInput;
//     notifyListeners();
//   }

//   setUserHour(JikanExerciseState jikanExerciseState, String userHour) {
//     jikanExerciseState.userHour = userHour;
//     notifyListeners();
//   }

//   setUserMin(JikanExerciseState jikanExerciseState, String userMin) {
//     jikanExerciseState.userMin = userMin;
//     notifyListeners();
//   }

//   setUserSec(JikanExerciseState jikanExerciseState, String userSec) {
//     jikanExerciseState.userSec = userSec;
//     notifyListeners();
//   }
// }
