part of '_field_controller.dart';

extension Cursor on FieldController {
  getCursorColor() => (model.value.valid
      ? (model.value.cursorColor ?? model.value.color)
      : model.value.showInvalidColorWhenUseTextMask
          ? model.value.invalidColor
          : model.value.cursorColor);
}
