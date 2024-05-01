import 'package:afiliado_vendas_flutter/services/imagens.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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
      ignorePointer ? IgnorePointer(child: _buildChild()) : _buildChild();

  _buildChild() => EditarFotoComponente(
      foto: controller.produtoFoto,
      child: Obx(() => controller.produtoFoto.value.isNotEmpty
          ? Image.memory(controller.produtoFoto.value,
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
