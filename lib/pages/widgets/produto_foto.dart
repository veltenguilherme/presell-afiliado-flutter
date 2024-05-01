import 'package:afiliado_vendas_flutter/services/imagens.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../../models/components/layout_builder/_builder.dart';
import '../home/_controller.dart';
import 'editar_foto/component.dart';

class ProdutoFoto extends StatelessWidget {
  final HomeController controller;
  final LayoutBuilderModel layoutBuilder;
  final bool ignorePointer;
  const ProdutoFoto({
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

  _buildChild() => EditarFotoComponente(
      foto: configuracao.produtoFoto,
      child: Obx(() => configuracao.produtoFoto!.value.isNotEmpty
          ? Image.memory(configuracao.produtoFoto!.value,
              fit: BoxFit.fill,
              width: layoutBuilder.produtoFotoWidth,
              height: layoutBuilder.produtoFotoHeight)
          : Image.asset(
              imagens.produtoPng,
              fit: BoxFit.fill,
              width: layoutBuilder.produtoFotoWidth,
              height: layoutBuilder.produtoFotoHeight,
            )));
}
