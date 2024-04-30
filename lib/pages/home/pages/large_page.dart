import 'package:afiliado_vendas_flutter/pages/widgets/reload_page.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/remove_glow_effect.dart';
import 'package:afiliado_vendas_flutter/pages/widgets/spaces.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/_base/component.dart';
import '../../widgets/produto_botao_comprar.dart';
import '../../widgets/produto_foto.dart';
import '../../widgets/produto_info_adicional.dart';
import '../../widgets/produto_sub_titulo.dart';
import '../../widgets/produto_titulo.dart';
import '../_controller.dart';

class LHomePage extends Component<HomeController> {
  LHomePage({super.key});

  @override
  HomeController getController() => HomeController();

  @override
  Widget buildContent(BuildContext context) => ReloadPageComponent(
      child: RemoveGlowEffect(
          child: Scaffold(
              backgroundColor: controller.backgroundCor.value,
              body: SafeArea(
                  minimum: EdgeInsets.all(4.5.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildProdutoTitulo(),
                              _buildProdutoSubTitulo(),
                              Spaces(size: 4.w),
                              _buildProdutoInfoAdicional(),
                              Spaces(size: 1.w),
                              _buildBotaoComprar(),
                            ]),
                        _buildProdutoFoto(),
                      ])))));

  _buildProdutoTitulo() => ProdutoTitulo(
        controller: controller,
        layoutBuilder: controller.largeLayout,
      );

  _buildProdutoSubTitulo() => ProdutoSubTitulo(
        controller: controller,
        layoutBuilder: controller.largeLayout,
      );

  _buildProdutoInfoAdicional() => ProdutoInfoAdicional(
        controller: controller,
        layoutBuilder: controller.largeLayout,
      );

  _buildBotaoComprar() => ProdutoBotaoComprar(
        controller: controller,
        layoutBuilder: controller.largeLayout,
      );

  _buildProdutoFoto() => ProdutoFoto(
        controller: controller,
        layoutBuilder: controller.largeLayout,
      );
}
