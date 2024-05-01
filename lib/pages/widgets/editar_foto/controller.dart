import 'dart:typed_data';

import 'package:get/get.dart';

import '../_base/component_controller.dart';

class EditarFotoComponentController extends ComponentController {
  final Rx<Uint8List> foto;
  EditarFotoComponentController({required this.foto});

  @override
  Future<void> initialize() async {}
}
