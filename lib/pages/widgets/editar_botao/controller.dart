import 'package:get/get.dart';

import '../_base/component_controller.dart';
import '../fields/_models/text_field.dart' as textField;

class EditarBotaoController extends ComponentController {
  final Rx<textField.TextField> campoTexto = textField.TextField(
    labelText: "",
    maxLines: 5,
    showClearButton: true,
    selectAllTextOnTap: false,
    required: true,
  ).obs;

  final Rx<textField.TextField> linkAfiliado = textField.TextField(
    labelText: "link de afiliado",
    maxLines: 5,
    showClearButton: true,
    selectAllTextOnTap: false,
    required: true,
  ).obs;

  final RxString texto;
  EditarBotaoController({required this.texto});

  @override
  Future<void> initialize() async {
    campoTexto.value.setValue(texto.value);
  }
}
