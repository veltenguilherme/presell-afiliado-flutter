import 'dart:async';
import 'dart:typed_data';

import 'package:afiliado_vendas_flutter/services/configuracoes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';
import '../../models/components/layout_builder/_builder.dart';
import '../../models/configuracao.dart';
import '../../services/rotas.dart';
import '../widgets/_base/component_controller.dart';

part 'layouts/large_layout.dart';
part 'layouts/medium_layout.dart';
part 'layouts/small_layout.dart';

class HomeController extends ComponentController {
  LayoutBuilderModel smallLayout = LayoutBuilderModel();
  LayoutBuilderModel mediumLayout = LayoutBuilderModel();
  LayoutBuilderModel largeLayout = LayoutBuilderModel();
  Timer? timer;
  @override
  Future<void> initialize() async {
    timer?.cancel();

    await _carregarLayout().whenComplete(() async {
      await super.initialize();

      configuracao = await configuracoes.get().whenComplete(() => timer =
          Timer.periodic(Duration(milliseconds: 200),
              (Timer t) async => await configuracoes.salvar(configuracao)));

      configuracao.releaseMode!(bool.parse(dotenv.env['RELEASE'].toString()));
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

  carregarLayoutPadrao() async {
    configuracao.backgroundCor!(Configuracao.backgroundCorDefault);

    configuracao.titulo!(Configuracao.tituloDefault);
    configuracao.tituloCor!(Configuracao.tituloCorDefault);

    configuracao.subTitulo!(Configuracao.subTituloDefault);
    configuracao.subTituloCor!(Configuracao.subTituloCorDefault);

    configuracao.infoAdicional!(Configuracao.infoAdicionalDefault);
    configuracao.infoAdicionalCor!(Configuracao.infoAdicionarCorDefault);

    configuracao.produtoFoto!(Uint8List(0));

    configuracao.botaoTexto!(Configuracao.botaoTextoDefault);
    configuracao.botaoCor!(Configuracao.botaoCorDefault);
    configuracao.botaoTextoCor!(Configuracao.botaoTextoCorDefault);

    configuracao.linkAfiliado!("");

    await configuracoes.salvar(configuracao);
  }

  publicarSite() async {}

  irParaSiteAfiliado() => rotas
      .launchURL(Uri(scheme: 'https', host: configuracao.linkAfiliado!.value));
}
