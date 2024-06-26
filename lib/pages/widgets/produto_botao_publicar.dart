import 'package:afiliado_vendas_flutter/pages/home/_controller.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/dialogs/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';
import '../../models/components/layout_builder/_builder.dart';
import 'dialogs/button.dart';
import 'none.dart';

class ProdutoBotaoPublicar extends StatelessWidget {
  final HomeController controller;
  final LayoutBuilderModel layoutBuilder;

  const ProdutoBotaoPublicar({
    super.key,
    required this.controller,
    required this.layoutBuilder,
  });

  @override
  Widget build(BuildContext context) => configuracao.releaseMode!.isFalse
      ? Button.buildDefault(
          color: Colors.green.obs,
          fontColor: Colors.white,
          title: "Publicar",
          fontSize: layoutBuilder.botaoComprarFontSize ?? 2.w,
          width: 35,
          height: layoutBuilder.botaoComprarHeight ?? 5.w,
          onPressed: () => progressDialog.tryRun(
              context,
              () async => await controller
                  .publicarSite()
                  .whenComplete(() => progressDialog.closeDialog())))
      : None();
}
