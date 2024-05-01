import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/tema.dart';

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

  Configuracao({
    this.backgroundCor,
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
  }) {
    this.backgroundCor ??= Color.fromARGB(255, 49, 49, 49).obs;
    this.titulo ??= "HAPPY HAIR".obs;
    this.tituloCor ??= Color.fromARGB(255, 219, 22, 88).obs;

    this.subTitulo ??= "Crescimento capilar acelerado!".obs;
    this.subTituloCor ??= tema.branco.obs;

    this.infoAdicional ??= "Acesse o Site Oficial com 68% de Desconto.".obs;
    this.infoAdicionalCor ??= tema.branco.obs;

    this.produtoFoto ??= Uint8List(0).obs;

    this.botaoTexto ??= "ACESSAR O SITE OFICIAL".obs;
    this.botaoCor ??= Colors.pink.obs;
    this.botaoTextoCor ??= tema.branco.obs;
    this.linkAfiliado ??= "".obs;
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
      };
}
