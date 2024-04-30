part of '_field_controller.dart';

extension FieldColor on FieldController {
  _getColor() => model.value.valid
      ? model.value.iconColor
      : model.value.showInvalidColorWhenUseTextMask
          ? model.value.invalidColor
          : model.value.iconColor;
}
