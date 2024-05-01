import 'package:afiliado_vendas_flutter/services/configuracoes.dart';
import 'package:afiliado_vendas_flutter/services/imagens.dart';
import 'package:afiliado_vendas_flutter/services/rotas.dart';

import 'services/di_container.dart';
import 'services/tema.dart';

class Startup {
  init() async {
    await _initServices();
  }

  _initServices() async {
    DiContainer.addSingleton(builder: () => TemaService());
    DiContainer.addSingleton(builder: () => RotasService());
    DiContainer.addSingleton(builder: () => ImagensService());
    DiContainer.addSingleton(builder: () => ConfiguracoesServico());
  }
}
