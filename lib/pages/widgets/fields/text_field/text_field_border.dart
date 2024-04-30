import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../_base/component.dart';
import '../_models/text_field.dart' as textField;
import '../animation_widget.dart';
import '_base/text_field_component.dart';
import '_base/text_field_controller.dart';

class TextFieldBorderComponent extends Component<TextFieldController> {
  final Rx<textField.TextField> model;
  final Function? onTap;
  final Function? onEditingComplete;
  final Function? onClear;
  final Function? onFocus;
  final Function? onLostFocus;
  final Function? onChanged;
  final Duration? delayDuration;
  final Duration? animationDuration;

  @override
  TextFieldController getController() => TextFieldController(
        model: model,
        onClear: onClear,
        onFocus: onFocus,
        onLostFocus: onLostFocus,
        onChangedEvt: onChanged,
      );

  TextFieldBorderComponent({
    Key? key,
    required this.model,
    this.onTap,
    this.onEditingComplete,
    this.onClear,
    this.onFocus,
    this.onChanged,
    this.delayDuration,
    this.animationDuration,
    this.onLostFocus,
  }) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return AnimationWidget.buildOpacityWidget(
        delayDuration: delayDuration,
        animationDuration: animationDuration,
        child: Obx(() => TextFieldComponent(
              model: controller.model as Rx<textField.TextField>,
              decoration: controller.getBorderDecoration(),
              onTap: onTap,
              onEditingComplete: onEditingComplete,
              onClear: onClear,
              onFocus: onFocus,
              onChanged: onChanged,
            )));
  }
}
