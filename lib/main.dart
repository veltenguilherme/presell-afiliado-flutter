import 'package:afiliado_vendas_flutter/services/rotas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'models/configuracao.dart';
import 'pages/widgets/scroll_behavior.dart';
import 'startup.dart';

Configuracao configuracao = Configuracao();
Future main() async {
  await Startup().init().whenComplete(() async => {
        await Future.delayed(const Duration(milliseconds: 100))
            .whenComplete(() async => runApp(Sizer(
                builder: (context, orientation, deviceType) => GetMaterialApp(
                      scrollBehavior:
                          ScrollBehaviorComponent().copyWith(scrollbars: false),
                      debugShowCheckedModeBanner: false,
                      initialRoute: Rotas.home,
                      getPages: rotas.getPages(),
                    ))))
      });
}
