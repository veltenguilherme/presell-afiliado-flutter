part of '_field_controller.dart';

extension ClearButton on FieldController {
  _buildClearButton({focusColor = true}) => Obx(() => model.value.password
      ? _buildEyeButton()
      : _showClearButton().isTrue
          ? IconButton(
              color: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              disabledColor: Colors.transparent,
              padding: EdgeInsets.only(right: 6.5.w),
              icon: Icon(
                Icons.close,
                size: 6.w,
                color: _getColor(),
              ),
              onPressed: _onClear,
            )
          : const None());

  _buildEyeButton() => Obx(() => IconButton(
        icon: Icon(
            model.value.obscuredText!.isTrue
                ? Icons.remove_red_eye_outlined
                : Icons.remove_red_eye,
            color: model.value.iconColor),
        onPressed: () =>
            model.value.obscuredText!(!model.value.obscuredText!.value),
      ));

  RxBool _showClearButton() {
    if (!model.value.showClearButton! ||
        model.value.readOnly && !model.value.showClearButtonWhenReadOnly) {
      return false.obs;
    }

    return (model.value.controller!.value.text.isNotEmpty ||
            model.value.readOnly && !model.value.showClearButtonWhenReadOnly)
        .obs;
  }

  _onClear() {
    if (model.value.useBeforeChangeEvt) {
      onClear?.call();
      return;
    }
    model.value.clear();
    model.value.valid = model.value.isValid();
    model.value.focusNode.requestFocus();

    if (model.value.readOnly) {
      model.value.focusNode.unfocus();
    }

    model.refresh();
    onClear?.call();
  }
}
