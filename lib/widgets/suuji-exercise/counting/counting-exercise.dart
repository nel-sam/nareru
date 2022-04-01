import 'package:flutter/material.dart';
import 'package:nareru/hd-helpers.dart';
import 'package:nareru/state/count/count-exercise-state.dart';

class CountingExercise extends StatefulWidget {
  final CountExerciseState state;
  final Function onUserCountSet;

  const CountingExercise({
    Key? key,
    required this.state,
    required this.onUserCountSet,
  }) : super(key: key);

  @override
  _CountingExerciseState createState() => _CountingExerciseState();
}

class _CountingExerciseState extends State<CountingExercise> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Column(
            children: [
              Icon(
                widget.state.icon,
                size: 90,
              ),
              Text(
                '${widget.state.count}${widget.state.counter}',
                style: TextStyle(
                  fontSize: 70,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(4, 18, 0, 1),
                    enabledBorder: Nar.getTextFieldBorder(
                        widget.state.correctAnswer, widget.state.userInput),
                    focusedBorder: Nar.getTextFieldBorder(
                        widget.state.correctAnswer, widget.state.userInput),
                  ),
                  onChanged: (String? newVal) {
                    if (newVal != null) {
                      setState(() {
                        widget.onUserCountSet(widget.state, newVal);
                      });
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
