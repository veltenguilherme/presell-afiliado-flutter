import 'package:afiliado_vendas_flutter/pages/widgets/fields/_base/_field_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../_base/component.dart';
import '../../_models/text_field.dart' as textField;
import 'text_field_controller.dart';

class TextFieldComponent extends Component<TextFieldController> {
  final Rx<textField.TextField> model;
  final Rx<InputDecoration>? decoration;
  final Function? onTap;
  final Function? onEditingComplete;
  final Function? onClear;
  final Function? onFocus;
  final Function? onChanged;

  TextFieldComponent({
    Key? key,
    required this.model,
    required this.decoration,
    this.onTap,
    this.onEditingComplete,
    this.onClear,
    this.onFocus,
    this.onChanged,
  }) : super(key: key);

  @override
  TextFieldController getController() => TextFieldController(
        model: model,
        onClear: onClear,
        onFocus: onFocus,
        onChangedEvt: onChanged,
        onTapEvt: onTap,
      );

  @override
  Widget buildContent(BuildContext context) {
    return Obx(() => GestureDetector(
            child: Theme(
          data: ThemeData(
              colorScheme: ColorScheme.light(
                  error: controller.model.value.cursorColor ??
                      controller.model.value.color)),
          child: TextFormField(
              key: key,
              selectionControls: controller.buildSelectionControls(),
              controller: model.value.controller,
              enableInteractiveSelection:
                  controller.model.value.enableInteractiveSelection,
              autofocus: controller.model.value.autoFocus,
              maxLength: controller.model.value.maxLength,
              minLines: controller.model.value.minLines!,
              maxLines: controller.model.value.maxLines!,
              cursorColor: controller.getCursorColor(),
              decoration: decoration?.value ?? controller.getDecoration(),
              style: TextStyle(fontSize: model.value.fontSize!.w),
              inputFormatters: model.value.inputFormatters,
              keyboardType: model.value.keyboardType,
              focusNode: controller.model.value.focusNode,
              readOnly: controller.model.value.readOnly,
              obscureText: controller.model.value.password &&
                  controller.model.value.obscuredText!.value,
              validator: controller.buildValidator,
              textInputAction:
                  controller.model.value.setFocusToNextComponentOnLeave
                      ? TextInputAction.next
                      : TextInputAction.done,
              onTap: () async => await controller.onTap(),
              onChanged: (value) async => await controller.onChanged(value),
              onFieldSubmitted: (value) => controller.onSubmitted(value),
              onEditingComplete: () => {
                    onEditingComplete?.call(),
                    controller.onEditingComplete(),
                  }),
        )));
  }

  @override
  onKeyboardHidden(context) => {FocusManager.instance.primaryFocus?.unfocus()};

  @override
  onKeyboardVisible(context) => {};
}
