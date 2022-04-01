import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nrs_flutter_lib/constants.dart';

class JikanNotifier extends ChangeNotifier {
  late Function() _getStateItem;
  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});

  JikanNotifier(Function() getStateItem) {
    _getStateItem = getStateItem;
  }

  void clearInput() {
    _getStateItem().clear();
    deboucedNotifyListeners();
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

  updateHour(String input) {
    var active = _getStateItem();
    active.userHour = input;
    deboucedNotifyListeners();
  }

  updateMin(String input) {
    var active = _getStateItem();
    active.userMin = input;
    deboucedNotifyListeners();
  }

  updateSec(String input) {
    var active = _getStateItem();
    active.userSec = input;
    deboucedNotifyListeners();
  }
}
