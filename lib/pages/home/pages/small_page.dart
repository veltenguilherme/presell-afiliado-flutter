import 'package:afiliado_vendas_flutter/pages/widgets/produto_botao_publicar.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/reload_page.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/remove_glow_effect.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/spaces.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../main.dart';
import '../../widgets/_base/component.dart';
import '../../widgets/cor_component.dart';
import '../../widgets/layout_default_botao.dart';
import '../../widgets/produto_botao_comprar.dart';
import '../../widgets/produto_foto.dart';
import '../../widgets/produto_info_adicional.dart';
import '../../widgets/produto_sub_titulo.dart';
import '../../widgets/produto_titulo.dart';
import '../_controller.dart';

class SHomePage extends Component<HomeController> {
  SHomePage({super.key});

  @override
  HomeController getController() => HomeController();

  @override
  Widget buildContent(BuildContext context) => ReloadPageComponent(
      child: RemoveGlowEffect(
          child: Obx(() => Scaffold(
              backgroundColor: configuracao.backgroundCor!.value,
              body: SafeArea(
                  child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 18.w),
                      child: Center(
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildBackgroundColorPicker(),
                                Spaces(size: 2.w),
                                _buildBotaoLayoutDefault(),
                              ]),
                          Spaces(size: 1.w),
                          _buildProdutoTitulo(),
                          _buildProdutoSubTitulo(),
                          Spaces(size: 4.w),
                          _buildProdutoInfoAdicional(),
                          _buildProdutoFoto(),
                          Spaces(size: 1.w),
                          _buildBotaoComprar(),
                          Spaces(size: 15.w),
                          _buildBotaoPublicarSite(),
                        ]),
                      )))))));

  _buildBackgroundColorPicker() => CorComponent(
        cor: configuracao.backgroundCor!,
        titulo: "Cor de fundo",
      );

  _buildBotaoLayoutDefault() => LayoutDefaultBotaoComponent(
        controller: controller,
        layoutBuilder: controller.smallLayout,
      );

  _buildProdutoTitulo() => ProdutoTitulo(
        controller: controller,
        layoutBuilder: controller.smallLayout,
      );

  _buildProdutoSubTitulo() => ProdutoSubTitulo(
        controller: controller,
        layoutBuilder: controller.smallLayout,
      );

  _buildProdutoInfoAdicional() => ProdutoInfoAdicional(
        controller: controller,
        layoutBuilder: controller.smallLayout,
      );

  _buildProdutoFoto() => ProdutoFoto(
        controller: controller,
        layoutBuilder: controller.smallLayout,
      );

  _buildBotaoComprar() => ProdutoBotaoComprar(
        controller: controller,
        layoutBuilder: controller.smallLayout,
      );

  _buildBotaoPublicarSite() => ProdutoBotaoPublicar(
        controller: controller,
        layoutBuilder: controller.smallLayout,
      );
}
