import 'package:afiliado_vendas_flutter/services/configuracoes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';
import '../../models/components/layout_builder/_builder.dart';
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
      configuracao = await configuracoes.get();
    });
  }

  _carregarLayout() async {
    _buildLargeLayout();
    _buildMediumLayout();
    _buildSmallLayout();

    _buildScrollListener();
  }

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
