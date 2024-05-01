import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/configuracao.dart';
import 'di_container.dart';

final configuracoes = DiContainer.resolve<ConfiguracoesServico>();

class ConfiguracoesServico {
  static const _configuracoesKey = 'configuracoes';

  Future<Configuracao> get() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonSettings = prefs.getString(_configuracoesKey);

    if (jsonSettings?.isEmpty ?? true) return Configuracao();

    final configuracaoMap = jsonDecode(jsonSettings as String);
    return Configuracao.fromJson(configuracaoMap);
  }

  Future salvar(Configuracao? configuracao) async {
    if (configuracao == null) return;

    final jsonSettings = jsonEncode(configuracao);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_configuracoesKey, jsonSettings);
  }
}
