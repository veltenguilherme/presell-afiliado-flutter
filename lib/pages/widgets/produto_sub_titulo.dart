import 'package:afiliado_vendas_flutter/pages/home/_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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
      ignorePointer ? IgnorePointer(child: _buildChild()) : _buildChild();

  _buildChild() => EditarTextoComponente(
      cor: controller.subTituloCor,
      texto: controller.subTitulo,
      child: Obx(() => Text(controller.subTitulo.value, style: _getStyle())));

  _getStyle() => TextStyle(
      color: controller.subTituloCor.value,
      fontSize: layoutBuilder.produtoSubTituloFontSize,
      fontWeight: FontWeight.w300);
}
