import 'package:afiliado_vendas_flutter/pages/widgets/dialogs/progress_dialog.dart';
import 'package:afiliado_vendas_flutter/services/configuracoes.dart';
import 'package:afiliado_vendas_flutter/services/imagens.dart';
import 'package:afiliado_vendas_flutter/services/rotas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'services/di_container.dart';
import 'services/tema.dart';

class Startup {
  static final Startup _singleton = Startup._internal();
  factory Startup() => _singleton;
  Startup._internal();

  init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await _setEnviroment();
    await _initServices();
    ;
  }

  _initServices() async {
    DiContainer.addSingleton(builder: () => TemaService());
    DiContainer.addSingleton(builder: () => RotasService());
    DiContainer.addSingleton(builder: () => ImagensService());
    DiContainer.addSingleton(builder: () => ConfiguracoesServico());
    DiContainer.addSingleton(builder: () => ProgressDialogService());
  }

  _setEnviroment() async {
    dotenv.clean();
    await dotenv.load(fileName: ".env");
  }
}
