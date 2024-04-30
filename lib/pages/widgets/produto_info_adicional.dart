import 'package:afiliado_vendas_flutter/pages/home/_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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
      Obx(() => Text(controller.getProdutoInfoAdicional(), style: _getStyle()));

  _getStyle() => TextStyle(
      color: controller.textosCor.value,
      fontSize: layoutBuilder.produtoInfoAdicionalFontSize,
      fontWeight: FontWeight.w300);
}
