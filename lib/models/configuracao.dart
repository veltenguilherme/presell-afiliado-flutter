import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class Configuracao {
  Rx<Color>? backgroundCor;

  RxString? titulo;
  Rx<Color>? tituloCor;

  RxString? subTitulo;
  Rx<Color>? subTituloCor;

  RxString? infoAdicional;
  Rx<Color>? infoAdicionalCor;

  Rx<Uint8List>? produtoFoto;

  RxString? botaoTexto;
  RxString? linkAfiliado;
  Rx<Color>? botaoCor;
  Rx<Color>? botaoTextoCor;
  RxBool? releaseMode;

  static const backgroundCorDefault = Color.fromARGB(255, 49, 49, 49);
  static const tituloDefault = "HAPPY HAIR";
  static const tituloCorDefault = Color.fromARGB(255, 219, 22, 88);
  static const subTituloDefault = "Crescimento capilar acelerado!";
  static const subTituloCorDefault = Colors.white;
  static const infoAdicionalDefault =
      "Acesse o Site Oficial com 68% de Desconto.";
  static const infoAdicionarCorDefault = Colors.white;
  static const botaoTextoDefault = "ACESSAR O SITE OFICIAL";
  static const botaoCorDefault = Colors.pink;
  static const botaoTextoCorDefault = Colors.white;

  Configuracao(
      {this.backgroundCor,
      this.titulo,
      this.tituloCor,
      this.subTitulo,
      this.subTituloCor,
      this.infoAdicional,
      this.infoAdicionalCor,
      this.produtoFoto,
      this.botaoTexto,
      this.linkAfiliado,
      this.botaoCor,
      this.botaoTextoCor,
      this.releaseMode}) {
    this.backgroundCor ??= backgroundCorDefault.obs;
    this.titulo ??= tituloDefault.obs;
    this.tituloCor ??= tituloCorDefault.obs;

    this.subTitulo ??= subTituloDefault.obs;
    this.subTituloCor ??= subTituloCorDefault.obs;

    this.infoAdicional ??= infoAdicionalDefault.obs;
    this.infoAdicionalCor ??= infoAdicionarCorDefault.obs;

    this.produtoFoto ??= Uint8List(0).obs;

    this.botaoTexto ??= botaoTextoDefault.obs;
    this.botaoCor ??= botaoCorDefault.obs;
    this.botaoTextoCor ??= botaoTextoCorDefault.obs;
    this.linkAfiliado ??= "".obs;

    this.releaseMode ??= false.obs;
  }

  factory Configuracao.fromJson(Map<String, dynamic> json) => Configuracao(
        backgroundCor: (Color(json['backgroundCor'])).obs,
        titulo: (json['titulo'] as String).obs,
        tituloCor: (Color(json['tituloCor'])).obs,
        subTitulo: (json['subTitulo'] as String).obs,
        subTituloCor: (Color(json['subTituloCor'])).obs,
        infoAdicional: (json['infoAdicional'] as String).obs,
        infoAdicionalCor: (Color(json['infoAdicionalCor'])).obs,
        produtoFoto: Uint8List.fromList(json['produtoFoto'].cast<int>()).obs,
        botaoTexto: (json['botaoTexto'] as String).obs,
        botaoCor: (Color(json['botaoCor'])).obs,
        botaoTextoCor: (Color(json['botaoTextoCor'])).obs,
        releaseMode: (json['releaseMode'] as bool).obs,
      );

  Map<String, dynamic> toJson() => {
        'backgroundCor': backgroundCor!.value.value,
        'titulo': titulo!.value,
        'tituloCor': tituloCor!.value.value,
        'subTitulo': subTitulo!.value,
        'subTituloCor': subTituloCor!.value.value,
        'infoAdicional': infoAdicional!.value,
        'infoAdicionalCor': infoAdicionalCor!.value.value,
        'produtoFoto': produtoFoto!.value.toList(),
        'botaoTexto': botaoTexto!.value,
        'botaoCor': botaoCor!.value.value,
        'botaoTextoCor': botaoTextoCor!.value.value,
        'releaseMode': releaseMode!.value,
      };
}
