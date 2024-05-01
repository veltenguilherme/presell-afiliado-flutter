import 'package:afiliado_vendas_flutter/pages/home/_controller.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/editar_texto/component.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../../models/components/layout_builder/_builder.dart';

class ProdutoInfoAdicional extends StatelessWidget {
  final HomeController controller;
  final LayoutBuilderModel layoutBuilder;
  final bool ignorePointer;
  const ProdutoInfoAdicional({
    super.key,
    required this.controller,
    required this.layoutBuilder,
    this.ignorePointer = false,
  });

  @override
  Widget build(BuildContext context) =>
      ignorePointer || configuracao.releaseMode!.isTrue
          ? IgnorePointer(child: _buildChild())
          : _buildChild();

  _buildChild() => EditarTextoComponente(
      cor: configuracao.infoAdicionalCor!,
      texto: configuracao.infoAdicional!,
      child: Obx(
          () => Text(configuracao.infoAdicional!.value, style: _getStyle())));

  _getStyle() => TextStyle(
      color: configuracao.infoAdicionalCor!.value,
      fontSize: layoutBuilder.produtoInfoAdicionalFontSize,
      fontWeight: FontWeight.w300);
}
