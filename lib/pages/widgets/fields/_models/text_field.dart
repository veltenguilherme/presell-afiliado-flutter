import 'package:afiliado_vendas_flutter/extensoes/string.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../services/tema.dart';
import '../../dialogs/dialog_info.dart';
import 'field.dart';

class TextField extends Field {
  TextField({
    required String labelText,
    String? headerText,
    Color? color,
    String? mask,
    Color? iconColor,
    IconData? prefixIcon,
    String? prefixIconSvg,
    bool valid = true,
    bool focused = false,
    bool required = false,
    bool showRequiredIcon = true,
    bool readOnly = false,
    int? minLines,
    int? maxLines,
    bool autoFocus = false,
    bool cpfCnpj = false,
    bool email = false,
    int? maxLength,
    double? iconSize,
    bool? handleFocus,
    String? hintText,
    double? fontSize,
    bool password = false,
    Widget? suffixIcon,
    Color? cursorColor,
    dynamic controller,
    bool? showClearButton,
    bool useBeforeChangeEvt = false,
    bool? selectAllTextOnTap,
    TextInputType? keyboardType,
    bool enableInteractiveSelection = true,
    bool showClearButtonWhenReadOnly = false,
    bool setFocusToNextComponentOnLeave = true,
    List<TextInputFormatter>? inputFormatters,
    dynamic value,
    bool validateMask = true,
    int? tabIndex,
    bool? showInvalidColorWhenUseTextMask,
    RxBool? obscuredText,
  }) : super(
          focusNode: FocusNode(),
          color: color ?? tema.grey50,
          iconColor: iconColor ?? tema.secondary75,
          labelText: labelText,
          headerText: headerText,
          valid: valid,
          focused: focused,
          required: required,
          showRequiredIcon: showRequiredIcon,
          readOnly: readOnly,
          minLines: minLines,
          maxLines: maxLines,
          autoFocus: autoFocus,
          cpfCnpj: cpfCnpj,
          email: email,
          maxLength: maxLength,
          iconSize: iconSize ?? 6.5,
          handleFocus: handleFocus ?? true,
          hintText: hintText,
          fontSize: fontSize,
          password: password,
          suffixIcon: suffixIcon,
          cursorColor: cursorColor,
          mask: mask,
          controller: controller != null
              ? controller
              : mask != null
                  ? MaskedTextController(mask: mask)
                  : TextEditingController(),
          prefixIcon: prefixIcon ?? Icons.abc,
          prefixIconSvg: prefixIconSvg,
          showClearButton: showClearButton,
          useBeforeChangeEvt: useBeforeChangeEvt,
          selectAllTextOnTap: selectAllTextOnTap,
          keyboardType: keyboardType,
          enableInteractiveSelection: enableInteractiveSelection,
          showClearButtonWhenReadOnly: showClearButtonWhenReadOnly,
          inputFormatters: inputFormatters,
          setFocusToNextComponentOnLeave: setFocusToNextComponentOnLeave,
          value: value,
          tabIndex: tabIndex,
          showInvalidColorWhenUseTextMask:
              showInvalidColorWhenUseTextMask ?? true,
          obscuredText: obscuredText,
        );

  @override
  bool isValid() => !isInvalid();

  @override
  bool isInvalid({debouncer = true}) {
    bool useTextMask = (mask ?? "").isNotEmpty;

    if (useTextMask && cpfCnpj) {
      mask = controller.text.length == 14 && !controller.text.contains("/")
          ? "000.000.000-00"
          : controller.mask;

      if (!_validarCpfCnpj(debouncer)) return true;
    }

    if (useTextMask && controller.text.isEmpty && !this.required) return false;

    return (useTextMask
        ? (mask!.toString().length != controller.text.length)
        : controller!.text.isEmpty && this.required);
  }

  _validarCpfCnpj(debounce) {
    if (mask!.toString().length == controller.text.length &&
        !((controller.text as String).isCpf ||
            (controller.text as String).isCnpj)) {
      if (debounce && (controller.text as String).isCpfMaskedLength())
        debouncer!
            .run(() => _showDialogDocumentoInvalido(), Duration(seconds: 1));
      else
        _showDialogDocumentoInvalido();

      return false;
    }

    debouncer!.cancel();
    return true;
  }

  _showDialogDocumentoInvalido() =>
      DialogInfo.show(message: "Documento inválido.");

  @override
  bool isEmpty() => controller!.text.isEmpty;

  @override
  bool isNotEmpty() => controller!.text.isNotEmpty;

  @override
  String getTextValue() => controller!.text;

  double getNumberValue() {
    if (!(controller is MoneyMaskedTextController))
      return (controller.text as String).removerMascaraDinheiro();

    return (controller as MoneyMaskedTextController).numberValue;
  }

  String getUnmaskedTextValue() => controller!.unmasked;

  @override
  setValue(value) {
    if (controller is MoneyMaskedTextController) {
      (controller! as MoneyMaskedTextController).updateValue(value);
    } else
      controller!.text = value?.toString() ?? '';

    valid = true;
  }

  @override
  clear({unfocus = true}) {
    if (unfocus) FocusManager.instance.primaryFocus?.unfocus();
    controller.clear();
    value = null;
    valid = true;
  }
}
