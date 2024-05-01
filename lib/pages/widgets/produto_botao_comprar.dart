import 'package:afiliado_vendas_flutter/pages/home/_controller.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/editar_botao/component.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../models/components/layout_builder/_builder.dart';
import 'dialogs/button.dart';

class ProdutoBotaoComprar extends StatelessWidget {
  final HomeController controller;
  final LayoutBuilderModel layoutBuilder;
  final bool ignorePointer;
  const ProdutoBotaoComprar({
    super.key,
    required this.controller,
    required this.layoutBuilder,
    this.ignorePointer = false,
  });

  @override
  Widget build(BuildContext context) =>
      ignorePointer ? IgnorePointer(child: _buildChild()) : _buildChild();

  _buildChild() => EditarBotaoComponente(
      corBotao: controller.botaoCor,
      corTexto: controller.botaoTextoCor,
      texto: controller.botaoTexto,
      linkAfiliado: controller.linkAfiliado,
      child: IgnorePointer(
          child: Obx(() => Button.buildDefault(
              color: controller.botaoCor,
              fontColor: controller.botaoTextoCor.value,
              title: controller.botaoTexto.value,
              fontSize: layoutBuilder.botaoComprarFontSize ?? 2.w,
              width: layoutBuilder.botaoComprarWidth ?? 50,
              height: layoutBuilder.botaoComprarHeight ?? 5.w,
              onPressed: () => {}))));
}
