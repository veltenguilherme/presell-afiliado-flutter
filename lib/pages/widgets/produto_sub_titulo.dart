import 'package:afiliado_vendas_flutter/pages/home/_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../../models/components/layout_builder/_builder.dart';
import 'editar_texto/component.dart';

class ProdutoSubTitulo extends StatelessWidget {
  final HomeController controller;
  final LayoutBuilderModel layoutBuilder;
  final bool ignorePointer;
  const ProdutoSubTitulo({
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
      cor: configuracao.subTituloCor!,
      texto: configuracao.subTitulo!,
      child:
          Obx(() => Text(configuracao.subTitulo!.value, style: _getStyle())));

  _getStyle() => TextStyle(
      color: configuracao.subTituloCor!.value,
      fontSize: layoutBuilder.produtoSubTituloFontSize,
      fontWeight: FontWeight.w300);
}
