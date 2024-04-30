import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationWidget {
  static buildDelayedWidget({
    required delayDuration,
    required animationDuration,
    required animation,
    required child,
  }) =>
      DelayedWidget(
        delayDuration: delayDuration ?? Duration(milliseconds: 0),
        animationDuration: animationDuration ?? Duration(seconds: 0),
        animation: animation ?? DelayedAnimations.SLIDE_FROM_TOP,
        child: child,
      );

  static buildOpacityWidget({
    required delayDuration,
    required animationDuration,
    required child,
  }) {
    RxBool visible = false.obs;
    WidgetsBinding.instance.addPostFrameCallback((value) async =>
        await Future.delayed(delayDuration ?? Duration(seconds: 0))
            .whenComplete(() => visible(true)));

    return Obx(() => AnimatedOpacity(
          opacity: visible.value ? 1.0 : 0.0,
          duration: animationDuration ?? Duration(seconds: 0),
          child: child,
        ));
  }
}
