import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nrs_flutter_lib/constants.dart';

class AgeNotifier extends ChangeNotifier {
  late Function() _getStateItem;
  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});

  AgeNotifier(Function() getStateItem) {
    _getStateItem = getStateItem;
  }

  deboucedNotifyListeners() {
    if (!_debounce.isActive) {
      _debounce.cancel();
    }

    _debounce = Timer(
        const Duration(milliseconds: DEBOUNCE_TIME), () => notifyListeners());
  }

  getStateItem() {
    return _getStateItem();
  }

  void updateAge(String newVal) {
    _getStateItem().userInput = newVal;
    deboucedNotifyListeners();
  }
}
