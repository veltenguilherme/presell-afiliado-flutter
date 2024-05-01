import 'package:afiliado_vendas_flutter/pages/widgets/reload_page.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/remove_glow_effect.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/spaces.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/_base/component.dart';
import '../../widgets/cor_component.dart';
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
              backgroundColor: controller.backgroundCor.value,
              body: SafeArea(
                  child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 18.w),
                      child: Center(
                        child: Column(children: [
                          _buildBackgroundColorPicker(),
                          Spaces(size: 1.w),
                          _buildProdutoTitulo(),
                          _buildProdutoSubTitulo(),
                          Spaces(size: 4.w),
                          _buildProdutoInfoAdicional(),
                          _buildProdutoFoto(),
                          Spaces(size: 1.w),
                          _buildBotaoComprar(),
                        ]),
                      )))))));

  _buildBackgroundColorPicker() =>
      CorComponent(cor: controller.backgroundCor, titulo: "Cor de fundo");

  _buildProdutoTitulo() => ProdutoTitulo(
      controller: controller, layoutBuilder: controller.smallLayout);

  _buildProdutoSubTitulo() => ProdutoSubTitulo(
        controller: controller,
        layoutBuilder: controller.smallLayout,
      );

  _buildProdutoInfoAdicional() => ProdutoInfoAdicional(
        controller: controller,
        layoutBuilder: controller.smallLayout,
      );

  _buildBotaoComprar() => ProdutoBotaoComprar(
        controller: controller,
        layoutBuilder: controller.smallLayout,
      );

  _buildProdutoFoto() => ProdutoFoto(
        controller: controller,
        layoutBuilder: controller.smallLayout,
      );
}
