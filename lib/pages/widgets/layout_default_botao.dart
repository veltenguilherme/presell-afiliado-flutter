import 'package:afiliado_vendas_flutter/pages/home/_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';
import '../../models/components/layout_builder/_builder.dart';
import 'dialogs/button.dart';
import 'none.dart';

class LayoutDefaultBotaoComponent extends StatelessWidget {
  final HomeController controller;
  final LayoutBuilderModel layoutBuilder;

  const LayoutDefaultBotaoComponent({
    super.key,
    required this.controller,
    required this.layoutBuilder,
  });

  @override
  Widget build(BuildContext context) => configuracao.releaseMode!.isFalse
      ? Button.buildDefault(
          color: Colors.blue.obs,
          fontColor: Colors.white,
          title: "Carregar Presell Padrão",
          fontSize: 3.w,
          width: 45,
          height: 8.w,
          onPressed: () => controller.carregarLayoutPadrao())
      : None();
}
