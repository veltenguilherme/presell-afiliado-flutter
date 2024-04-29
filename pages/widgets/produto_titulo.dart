import 'package:afiliado_vendas_flutter/pages/home/_controller.dart';
import 'package:flutter/widgets.dart';

import '../../models/components/layout_builder/_builder.dart';

class ProdutoTitulo extends StatelessWidget {
  final HomeController controller;
  final LayoutBuilderModel layoutBuilder;
  const ProdutoTitulo({
    super.key,
    required this.controller,
    required this.layoutBuilder,
  });

  @override
  Widget build(BuildContext context) =>
      Text(controller.getProdutoTitulo(), style: _getStyle());

  _getStyle() => TextStyle(
      color: controller.getProdutoTituloCor(),
      fontSize: layoutBuilder.produtoTituloFontSize,
      fontWeight: FontWeight.bold);
}
