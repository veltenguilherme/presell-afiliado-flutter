import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:sizer/sizer.dart';

import '../_base/component.dart';

import 'controller.dart';

class EditarFotoComponente extends Component<EditarFotoComponentController> {
  final Widget child;
  final Rx<Uint8List>? foto;

  @override
  EditarFotoComponentController getController() =>
      EditarFotoComponentController(foto: foto ?? Uint8List(0).obs);

  EditarFotoComponente({
    super.key,
    required this.child,
    required this.foto,
  });

  @override
  Widget buildContent(BuildContext context) => InkWell(
      borderRadius: BorderRadius.circular(2.w),
      child: child,
      onTap: () async =>
          controller.foto(await ImagePickerWeb.getImageAsBytes()));
}
