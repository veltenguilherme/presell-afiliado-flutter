import 'package:afiliado_vendas_flutter/pages/widgets/cor_component.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/dialogs/dialog_info.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/fields/text_field/text_field_border.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../_base/component.dart';

import 'controller.dart';

class EditarBotaoComponente extends Component<EditarBotaoController> {
  final Widget child;
  final RxString texto;
  final RxString linkAfiliado;
  final Rx<Color> corBotao;
  final Rx<Color> corTexto;

  @override
  EditarBotaoController getController() => EditarBotaoController(texto: texto);

  EditarBotaoComponente({
    super.key,
    required this.child,
    required this.corBotao,
    required this.corTexto,
    required this.texto,
    required this.linkAfiliado,
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
      onPressed: () => {Navigator.pop(Get.context!)});

  _buildTextoECor() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Container(
                width: 58.w,
                child: TextFieldBorderComponent(
                    model: controller.campoTexto,
                    onChanged: (value) => controller.texto(
                        value.isEmpty ? controller.texto.value : value))),
            Spaces(size: 1.w),
            Container(
                width: 58.w,
                child: TextFieldBorderComponent(
                    model: controller.linkAfiliado,
                    onChanged: (value) => linkAfiliado(
                        value.isEmpty ? linkAfiliado.value : value)))
          ]),
          Column(children: [
            CorComponent(cor: corTexto, titulo: "Texto"),
            Spaces(size: 1.w),
            CorComponent(cor: corBotao, titulo: "Botão")
          ])
        ],
      );
}
