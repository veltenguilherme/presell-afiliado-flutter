import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  final Rx<Color> backgroundCor = Color.fromARGB(255, 49, 49, 49).obs;

  final RxString titulo = "HAPPY HAIR".obs;
  final Rx<Color> tituloCor = Color.fromARGB(255, 219, 22, 88).obs;

  final RxString subTitulo = "Crescimento capilar acelerado!".obs;
  final Rx<Color> subTituloCor = tema.branco.obs;

  final RxString infoAdicional =
      "Acesse o Site Oficial com 68% de Desconto.".obs;
  final Rx<Color> infoAdicionalCor = tema.branco.obs;

  final Rx<Uint8List> produtoFoto = Uint8List(0).obs;

  final RxString botaoTexto = "ACESSAR O SITE OFICIAL".obs;
  final RxString linkAfiliado = "".obs;
  final Rx<Color> botaoCor = Colors.pink.obs;
  final Rx<Color> botaoTextoCor = tema.branco.obs;

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
