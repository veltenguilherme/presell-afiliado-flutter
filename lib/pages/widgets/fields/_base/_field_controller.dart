import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../../services/imagens.dart';
import '../../../../services/tema.dart';
import '../../_base/component_controller.dart';
import '../../none.dart';
import '../_models/field.dart';

part 'cursor.dart';
part 'borders.dart';
part 'label_style.dart';
part 'state.dart';
part 'field_color.dart';
part 'suffix_icon.dart';
part 'prefix_icon.dart';
part 'clear_button.dart';

class FieldController extends ComponentController {
  final Rx<Field> model;
  final Function? onClear;

  FieldController(
    this.model,
    this.onClear,
  );

  getDecoration() => InputDecoration(
        border: InputBorder.none,
        hintText: model.value.labelText,
        counterText: "",
      );

  getBorderDecoration() => InputDecoration(
        hintText: model.value.hintText,
        labelText: model.value.labelText.isEmpty ? null : model.value.labelText,
        contentPadding:
            EdgeInsets.symmetric(vertical: 5.5.w, horizontal: 3.5.w),
        counterText: '',
        iconColor: model.value.iconColor,
        filled: true,
        fillColor: model.value.color,
        focusedBorder: _getOutlineBorder(width: 2),
        enabledBorder: _getOutlineBorder(),
        labelStyle: _getLabelStyle(),
        prefixIcon: _getPrefixIcon(),
        suffixIcon: _getSuffixIcon(),
      ).obs;
}
