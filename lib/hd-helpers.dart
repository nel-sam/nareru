import 'package:flutter/material.dart';
import 'package:nareru/constants.dart';

class Nar {
  static OutlineInputBorder getTextFieldBorder(
      String correct, String userInput) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: correct == userInput ? CORRECT_COLOR : WRONG_COLOR,
      ),
    );
  }
}
