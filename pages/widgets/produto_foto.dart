import 'package:afiliado_vendas_flutter/services/imagens.dart';
import 'package:flutter/widgets.dart';

import '../../models/components/layout_builder/_builder.dart';
import '../home/_controller.dart';

class ProdutoFoto extends StatelessWidget {
  final HomeController controller;
  final LayoutBuilderModel layoutBuilder;
  const ProdutoFoto(
      {super.key, required this.controller, required this.layoutBuilder});

  @override
  Widget build(BuildContext context) => Image.asset(
        imagens.produtoPng,
        fit: BoxFit.fill,
        width: layoutBuilder.produtoFotoWidth,
        height: layoutBuilder.produtoFotoHeight,
      );
}
