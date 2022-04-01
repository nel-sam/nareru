import 'package:flutter/material.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/enums.dart';
import 'package:nrs_flutter_lib/extensions.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class QuestionFreeForm extends StatelessWidget {
  final String hintValue;
  final String activeValue;
  final List<String> correctValues;
  final Function(String) onChanged;
  final controller = TextEditingController();

  QuestionFreeForm({
    Key? key,
    required this.hintValue,
    required this.onChanged,
    required this.activeValue,
    required this.correctValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.text = activeValue;
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        width: 100,
        child: TextField(
          key: key,
          controller: controller,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(4, 18, 0, 1),
            labelText: correctValues.containsCaseInsensitive(activeValue)
                ? ''
                : hintValue,
            enabledBorder: getBorder(context),
            focusedBorder: getBorder(context),
          ),
          onChanged: (String? newVal) {
            if (newVal != null) {
              onChanged(newVal);
            }
          },
        ),
      ),
    );
  }

  OutlineInputBorder getBorder(BuildContext context) {
    var status = getCorrectStatus(activeValue);

    var color = WRONG_COLOR;

    switch (status) {
      case CorrectStatus.correct:
        color = CORRECT_COLOR;
        break;
      case CorrectStatus.wrong:
        color = WRONG_COLOR;
        break;
      case CorrectStatus.unstarted:
        color = Colors.grey;
        break;
      case CorrectStatus.inprogressCorrect:
        color = Nrs.getPrimaryColor(context);
        break;
    }

    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
    );
  }

  CorrectStatus getCorrectStatus(String userInput) {
    if (userInput.length == 0) {
      return CorrectStatus.unstarted;
    }

    if (correctValues.containsCaseInsensitive(userInput)) {
      return CorrectStatus.correct;
    }

    if (correctValues.containsSubCaseInsensitive(userInput)) {
      return CorrectStatus.inprogressCorrect;
    }

    return CorrectStatus.wrong;
  }
}
