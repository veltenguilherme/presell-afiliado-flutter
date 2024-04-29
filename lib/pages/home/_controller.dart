import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import '../../models/components/layout_builder/_builder.dart';
import '../../services/tema.dart';
import '../widgets/_base/component_controller.dart';

part 'layouts/large_layout.dart';
part 'layouts/medium_layout.dart';
part 'layouts/small_layout.dart';

class HomeController extends ComponentController {
  LayoutBuilderModel smallLayout = LayoutBuilderModel();
  LayoutBuilderModel mediumLayout = LayoutBuilderModel();
  LayoutBuilderModel largeLayout = LayoutBuilderModel();

  @override
  Future<void> initialize() async {
    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();
    await _carregarLayout().whenComplete(() async {
      await super.initialize();
    });
  }

  _carregarLayout() async {
    _buildLargeLayout();
    _buildMediumLayout();
    _buildSmallLayout();

    _buildScrollListener();
  }

  getBackgroundColor() => HexColor("#515151");

  getProdutoTitulo() => "HAPPY HAIR";

  getProdutoSubTitulo() => "Crescimento capilar acelerado!";

  getProdutoInfoAdicional() =>
      "Acesse o Site Oficial com 68% de Desconto\n* Frete Grátis";

  getProdutoTituloCor() => HexColor("#FF3881");

  getProdutoSubTituloCor() => tema.branco;

  getProdutoBotaoComprarTitulo() => "ACESSAR O SITE OFICIAL";

  _buildScrollListener() {
    smallLayout.scrollController!
        .addListener(() => _buildBotaoResetScroll(smallLayout));

    mediumLayout.scrollController!
        .addListener(() => _buildBotaoResetScroll(mediumLayout));

    largeLayout.scrollController!
        .addListener(() => _buildBotaoResetScroll(largeLayout));
  }

  _buildBotaoResetScroll(LayoutBuilderModel layout) {
    if (layout.scrollController!.offset >= 320)
      layout.mostrarBotaoResetScroll!(true);
    else
      layout.mostrarBotaoResetScroll!(false);
  }
}
