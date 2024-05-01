import 'package:afiliado_vendas_flutter/pages/widgets/reload_page.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/remove_glow_effect.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/spaces.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../main.dart';
import '../../widgets/_base/component.dart';
import '../../widgets/produto_botao_comprar.dart';
import '../../widgets/produto_foto.dart';
import '../../widgets/produto_info_adicional.dart';
import '../../widgets/produto_sub_titulo.dart';
import '../../widgets/produto_titulo.dart';
import '../_controller.dart';

class MHomePage extends Component<HomeController> {
  MHomePage({super.key});

  @override
  HomeController getController() => HomeController();

  @override
  Widget buildContent(BuildContext context) => ReloadPageComponent(
      child: RemoveGlowEffect(
          child: Obx(() => Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: configuracao.backgroundCor!.value,
              body: SafeArea(
                  child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 3.w),
                      child: Center(
                        child: Column(children: [
                          _buildProdutoTitulo(),
                          _buildProdutoSubTitulo(),
                          Spaces(size: 8.w),
                          _buildProdutoInfoAdicional(),
                          Spaces(size: 1.w),
                          _buildBotaoComprar(),
                          _buildProdutoFoto(),
                        ]),
                      )))))));

  _buildProdutoTitulo() => ProdutoTitulo(
        controller: controller,
        layoutBuilder: controller.mediumLayout,
        ignorePointer: true,
      );

  _buildProdutoSubTitulo() => ProdutoSubTitulo(
        controller: controller,
        layoutBuilder: controller.mediumLayout,
        ignorePointer: true,
      );

  _buildProdutoInfoAdicional() => ProdutoInfoAdicional(
        controller: controller,
        layoutBuilder: controller.mediumLayout,
        ignorePointer: true,
      );

  _buildBotaoComprar() => ProdutoBotaoComprar(
        controller: controller,
        layoutBuilder: controller.mediumLayout,
        ignorePointer: true,
      );

  _buildProdutoFoto() => ProdutoFoto(
        controller: controller,
        layoutBuilder: controller.mediumLayout,
        ignorePointer: true,
      );
}
