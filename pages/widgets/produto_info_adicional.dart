import 'package:afiliado_vendas_flutter/pages/home/_controller.dart';
import 'package:flutter/widgets.dart';

import '../../models/components/layout_builder/_builder.dart';

class ProdutoInfoAdicional extends StatelessWidget {
  final HomeController controller;
  final LayoutBuilderModel layoutBuilder;
  const ProdutoInfoAdicional({
    super.key,
    required this.controller,
    required this.layoutBuilder,
  });

  @override
  Widget build(BuildContext context) =>
      Text(controller.getProdutoInfoAdicional(), style: _getStyle());

  _getStyle() => TextStyle(
      color: controller.getProdutoSubTituloCor(),
      fontSize: layoutBuilder.produtoInfoAdicionalFontSize,
      fontWeight: FontWeight.w300);
}
