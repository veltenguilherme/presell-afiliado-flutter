import 'package:afiliado_vendas_flutter/pages/home/_controller.dart';
import 'package:flutter/widgets.dart';

import '../../models/components/layout_builder/_builder.dart';

class ProdutoSubTitulo extends StatelessWidget {
  final HomeController controller;
  final LayoutBuilderModel layoutBuilder;
  const ProdutoSubTitulo({
    super.key,
    required this.controller,
    required this.layoutBuilder,
  });

  @override
  Widget build(BuildContext context) =>
      Text(controller.getProdutoSubTitulo(), style: _getStyle());

  _getStyle() => TextStyle(
      color: controller.getProdutoSubTituloCor(),
      fontSize: layoutBuilder.produtoSubTituloFontSize,
      fontWeight: FontWeight.w300);
}
