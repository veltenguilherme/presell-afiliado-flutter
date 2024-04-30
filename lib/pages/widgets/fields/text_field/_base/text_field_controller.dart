import 'dart:async';
import 'dart:io';

import 'package:afiliado_vendas_flutter/extensoes/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../_base/_field_controller.dart';
import '../../_models/text_field.dart' as models;

class TextFieldController extends FieldController {
  final Rx<Timer> longPressTimer =
      Timer(const Duration(milliseconds: 200), () => {}).obs;
  final RxBool isLongPressed = false.obs;
  final Function? onFocus;
  final Function? onLostFocus;
  final Function? onChangedEvt;
  final Function? onTapEvt;

  TextFieldController({
    required Rx<models.TextField> model,
    Function? onClear,
    this.onFocus,
    this.onLostFocus,
    this.onChangedEvt,
    this.onTapEvt,
  }) : super(model, onClear);

  @override
  Future<void> initialize() async {
    _setFocusHandler();
  }

  _setFocusHandler() {
    model.value.focusNode.addListener(() => _handleFocus());

    if (model.value.focused) model.value.focusNode.requestFocus();
  }

  _handleFocus() {
    if (model.value.focusNode.hasFocus == model.value.focused) return;
    if (!model.value.handleFocus) return;

    model.value.focused = model.value.focusNode.hasFocus;
    model.refresh();

    if (model.value.focused)
      onFocus?.call();
    else
      onLostFocus?.call();
  }

  onTap() async {
    onTapEvt?.call();

    if (model.value.selectAllTextOnTap!) FieldState.selecionarTexto(model);
  }

  onChanged(value) async {
    model.value.valid = model.value.isValid();
    if (model.value.cpfCnpj) _setCpfCnpjMask();

    model.refresh();
    onChangedEvt?.call(value);
    model.value.textPasted = false;
  }

  onSubmitted(value) {
    if (value != "") _setNextFocus();
  }

  onEditingComplete() => _setNextFocus();

  _setNextFocus() {
    if (!model.value.setFocusToNextComponentOnLeave) {
      FocusManager.instance.primaryFocus?.unfocus();
    } else {
      model.value.focusNode.nextFocus();
    }
  }

  _setCpfCnpjMask() {
    if (!model.value.cpfCnpj) return;

    if (model.value.controller.value.text.isEmpty) {
      model.value.mask = "00.000.000/0000-00";
    }

    if (model.value.textPasted) {
      var unmaskedText =
          (model.value.controller.text as String).removerMascaraCpfOuCnpj();

      if (unmaskedText.length == 11) {
        _setMask("000.000.000-00");
      } else if (unmaskedText.length == 14) {
        _setMask("00.000.000/0000-00");
      }

      model.value.setValue(unmaskedText);
    } else {
      if ((model.value.controller.value.text.length <= 13 &&
          model.value.controller.value.text.isNotEmpty)) {
        _setMask("000.000.000-00");
      } else if ((model.value.controller.value.text.isEmpty ||
          model.value.controller.value.text.length >= 14)) {
        _setMask("00.000.000/0000-00");
      }
    }
  }

  _setMask(mask) {
    model.value.controller.mask = mask;
    model.value.mask = mask;

    model.refresh();
  }

  String? buildValidator(String? value) {
    if (model.value.email) return _buildValidatorEmail(value);

    return null;
  }

  _buildValidatorEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Informe um e-mail válido'
        : null;
  }

  buildSelectionControls() => kIsWeb
      ? null
      : Platform.isAndroid
          ? AppMaterialTextSelectionControls(onPaste: (value) => onPaste(value))
          : AppCupertinoTextSelectionControls(
              onPaste: (value) => onPaste(value));

  onPaste(value) {
    if (model.value.cpfCnpj) model.value.controller.mask = "00.000.000/0000-00";

    model.value.textPasted = true;
    model.refresh();
  }
}

class AppCupertinoTextSelectionControls extends CupertinoTextSelectionControls {
  AppCupertinoTextSelectionControls({
    required this.onPaste,
  });
  ValueChanged<TextSelectionDelegate> onPaste;
  @override
  Future<void> handlePaste(final TextSelectionDelegate delegate) {
    onPaste(delegate);
    // ignore: deprecated_member_use
    return super.handlePaste(delegate);
  }
}

class AppMaterialTextSelectionControls extends MaterialTextSelectionControls {
  AppMaterialTextSelectionControls({
    required this.onPaste,
  });
  ValueChanged<TextSelectionDelegate> onPaste;
  @override
  Future<void> handlePaste(final TextSelectionDelegate delegate) {
    onPaste(delegate);
    // ignore: deprecated_member_use
    return super.handlePaste(delegate);
  }
}
