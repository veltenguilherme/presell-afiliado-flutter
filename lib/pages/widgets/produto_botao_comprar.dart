import 'package:afiliado_vendas_flutter/pages/home/_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../models/components/layout_builder/_builder.dart';
import 'dialogs/button.dart';

class ProdutoBotaoComprar extends StatelessWidget {
  final HomeController controller;
  final LayoutBuilderModel layoutBuilder;
  const ProdutoBotaoComprar({
    super.key,
    required this.controller,
    required this.layoutBuilder,
  });

  @override
  Widget build(BuildContext context) => Obx(() => Button.buildDefault(
      color: controller.botaoCor,
      fontColor: controller.textosCor.value,
      title: controller.getProdutoBotaoComprarTitulo(),
      fontSize: layoutBuilder.botaoComprarFontSize ?? 2.w,
      width: layoutBuilder.botaoComprarWidth ?? 50,
      height: layoutBuilder.botaoComprarHeight ?? 5.w,
      onPressed: () => {}));
}
