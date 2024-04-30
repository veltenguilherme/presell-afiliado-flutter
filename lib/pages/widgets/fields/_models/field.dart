import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../services/tema.dart';
import '../../_base/component_controller.dart';

abstract class Field {
  Debounce? debouncer;
  bool valid;
  Color color;
  bool focused;
  String? mask;
  bool required;
  dynamic value;
  bool showRequiredIcon;
  bool readOnly;
  int? minLines;
  int? maxLines;
  bool autoFocus;
  bool cpfCnpj;
  bool email;
  int? maxLength;
  Color iconColor;
  double iconSize;
  String labelText;
  bool handleFocus;
  String? hintText;
  double? fontSize;
  bool password;
  Widget? suffixIcon;
  String? headerText;
  Color? cursorColor;
  dynamic controller;
  FocusNode focusNode;
  Color? focusedColor;
  IconData prefixIcon;
  String? prefixIconSvg;
  bool? showClearButton;
  bool useBeforeChangeEvt;
  TextOverflow textOverflow;
  bool? selectAllTextOnTap;
  TextInputType? keyboardType;
  bool enableInteractiveSelection;
  bool showClearButtonWhenReadOnly;
  bool setFocusToNextComponentOnLeave;
  final Color invalidColor = Colors.red;
  List<TextInputFormatter>? inputFormatters;
  bool textPasted;
  int? tabIndex;
  bool showInvalidColorWhenUseTextMask;
  RxBool? obscuredText;

  Field({
    this.debouncer,
    required this.iconColor,
    required this.color,
    required this.labelText,
    required this.focusNode,
    required this.prefixIcon,
    this.prefixIconSvg,
    this.valid = true,
    this.focused = false,
    this.mask,
    this.required = false,
    this.value,
    this.showRequiredIcon = true,
    this.readOnly = false,
    this.minLines,
    this.maxLines,
    this.autoFocus = false,
    this.cpfCnpj = false,
    this.email = false,
    this.maxLength,
    this.iconSize = 4,
    this.handleFocus = true,
    this.hintText,
    this.headerText,
    this.fontSize,
    this.password = false,
    this.suffixIcon,
    this.cursorColor,
    this.controller,
    this.focusedColor,
    this.showClearButton,
    this.useBeforeChangeEvt = false,
    this.textOverflow = TextOverflow.visible,
    this.selectAllTextOnTap = false,
    this.keyboardType,
    this.enableInteractiveSelection = false,
    this.showClearButtonWhenReadOnly = false,
    this.setFocusToNextComponentOnLeave = true,
    this.inputFormatters,
    this.textPasted = false,
    this.tabIndex,
    this.showInvalidColorWhenUseTextMask = true,
    this.obscuredText,
  }) {
    debouncer = debouncer ?? Debounce();
    maxLines = maxLines ?? (password ? 1 : 2);
    minLines ??= 1;
    fontSize ??= 4.5;
    showClearButton ??= true;
    selectAllTextOnTap ??= false;
    focusedColor ??= tema.secondary75;
    cursorColor ??= tema.secondary75;
    obscuredText ??= true.obs;
  }

  bool isValid();
  bool isInvalid({debouncer = false});

  bool isEmpty();
  bool isNotEmpty();

  String getTextValue();
  setValue(value);

  clear();
}
