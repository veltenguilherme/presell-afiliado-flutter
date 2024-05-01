import 'package:afiliado_vendas_flutter/pages/home/_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../main.dart';
import '../../models/components/layout_builder/_builder.dart';
import 'editar_texto/component.dart';

class ProdutoTitulo extends StatelessWidget {
  final HomeController controller;
  final LayoutBuilderModel layoutBuilder;
  final ignorePointer;
  const ProdutoTitulo({
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
      cor: configuracao.tituloCor!,
      texto: configuracao.titulo!,
      child: Obx(() => Text(configuracao.titulo!.value, style: _getStyle())));

  _getStyle() => TextStyle(
      color: configuracao.tituloCor!.value,
      fontSize: layoutBuilder.produtoTituloFontSize,
      fontWeight: FontWeight.bold);
}
