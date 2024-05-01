import 'package:get/get.dart';

import '../_base/component_controller.dart';
import '../fields/_models/text_field.dart' as textField;

class EditarTextoComponentController extends ComponentController {
  final Rx<textField.TextField> campoTexto = textField.TextField(
    labelText: "",
    maxLines: 5,
    showClearButton: true,
    selectAllTextOnTap: false,
    required: true,
  ).obs;

  final RxString texto;
  EditarTextoComponentController({required this.texto});

  @override
  Future<void> initialize() async {
    campoTexto.value.setValue(texto.value);
  }
}
