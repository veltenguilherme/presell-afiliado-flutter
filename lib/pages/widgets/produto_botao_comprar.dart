import 'package:afiliado_vendas_flutter/pages/home/_controller.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/editar_botao/component.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';
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
      ignorePointer && configuracao.releaseMode!.isFalse
          ? IgnorePointer(child: _buildChild())
          : _buildChild();

  _buildChild() => configuracao.releaseMode!.isFalse
      ? IgnorePointer(
          child: EditarBotaoComponente(
              corBotao: configuracao.botaoCor!,
              corTexto: configuracao.botaoTextoCor!,
              texto: configuracao.botaoTexto!,
              linkAfiliado: configuracao.linkAfiliado!,
              child: _buildBotao()))
      : Container(
          padding:
              EdgeInsets.only(top: 1.w, bottom: 1.w, left: 4.w, right: 4.w),
          child: _buildBotao());

  _buildBotao() => Obx(() => Button.buildDefault(
      color: configuracao.botaoCor,
      fontColor: configuracao.botaoTextoCor!.value,
      title: configuracao.botaoTexto!.value,
      fontSize: layoutBuilder.botaoComprarFontSize ?? 2.w,
      width: layoutBuilder.botaoComprarWidth ?? 50,
      height: layoutBuilder.botaoComprarHeight ?? 5.w,
      onPressed: () => controller.irParaSiteAfiliado()));
}
