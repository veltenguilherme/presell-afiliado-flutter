import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ComponentController {
  Debounce debouncer = Debounce(milliseconds: 2500);
  bool _isInitialized = false;
  RxBool keyboardVisible = false.obs;

  Future<void> checkInitialize() async {
    if (!_isInitialized) {
      _isInitialized = true;
      return initialize();
    }
  }

  Future<void> initialize() async {}

  removeKeyboardFocusAutomatically([milliseconds = 500]) => debouncer.run(() {
        FocusManager.instance.primaryFocus?.unfocus();
      }, Duration(milliseconds: milliseconds));
}

class Debounce {
  final int milliseconds;

  Timer? _timer;

  Debounce({this.milliseconds = 500});

  run(VoidCallback action, Duration duration) {
    if (null != _timer) {
      cancel();
    }
    _timer = Timer(duration, action);
  }

  cancel() {
    if (_timer != null) _timer!.cancel();
  }
}
