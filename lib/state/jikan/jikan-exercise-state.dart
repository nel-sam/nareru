class JikanExerciseState {
  String correctHour;
  String userHour = '';
  String correctMin;
  String userMin = '';
  String correctSec;
  String userSec = '';
  String hour;
  String min;
  String sec;
  bool hourState;
  bool minuteState;
  bool secondState;

  JikanExerciseState({
    required this.hour,
    required this.min,
    required this.sec,
    required this.correctHour,
    required this.correctMin,
    required this.correctSec,
    required this.hourState,
    required this.minuteState,
    required this.secondState,
  });
}
