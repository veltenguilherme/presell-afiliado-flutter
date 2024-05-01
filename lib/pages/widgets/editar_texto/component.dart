import 'package:afiliado_vendas_flutter/pages/widgets/cor_component.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/dialogs/dialog_info.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/fields/text_field/text_field_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../_base/component.dart';

import 'controller.dart';

class EditarTextoComponente extends Component<EditarTextoComponentController> {
  final Widget child;
  final RxString texto;
  final Rx<Color> cor;

  @override
  EditarTextoComponentController getController() =>
      EditarTextoComponentController(texto: texto);

  EditarTextoComponente({
    super.key,
    required this.child,
    required this.cor,
    required this.texto,
  });

  @override
  Widget buildContent(BuildContext context) => InkWell(
      borderRadius: BorderRadius.circular(3.w),
      onTap: () => {
            controller.campoTexto.value.setValue(texto.value),
            _buildDialogInfo()
          },
      child: Container(
          child: child,
          padding:
              EdgeInsets.only(top: 1.w, bottom: 1.w, left: 4.w, right: 4.w)));

  _buildDialogInfo() => DialogInfo.show(
      widgetMessage: _buildTextoECor(),
      cor: Colors.grey,
      onPressed: () => {
            print("opa"),
            Navigator.pop(Get.context!),
          });

  _buildTextoECor() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 60.w,
              child: TextFieldBorderComponent(
                  model: controller.campoTexto,
                  onChanged: (value) => controller
                      .texto(value.isEmpty ? controller.texto.value : value))),
          CorComponent(cor: cor, titulo: "Cor")
        ],
      );
}
