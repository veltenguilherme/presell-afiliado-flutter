import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SwitchBox {
  final RxBool checked;
  final String title;
  final RxBool readOnly;
  final Function? onChanged;
  final Function? onBeforeChange;
  final Color? fontColor;
  final double? fontSize;

  SwitchBox({
    required this.checked,
    required this.title,
    required this.readOnly,
    this.onChanged,
    this.onBeforeChange,
    this.fontColor,
    this.fontSize,
  });
}
