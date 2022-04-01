import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nrs_flutter_lib/constants.dart';

class CountNotifier with ChangeNotifier {
  late Function() _getStateItem;
  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});

  CountNotifier(Function() getStateItem) {
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

  updateCount(String userInput) {
    _getStateItem().userInput = userInput;
    deboucedNotifyListeners();
  }
}
