import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LayoutBuilderModel {
  double? produtoTituloFontSize;
  double? produtoSubTituloFontSize;
  double? produtoInfoAdicionalFontSize;
  double? botaoComprarWidth;
  double? botaoComprarHeight;
  double? botaoComprarFontSize;
  double? produtoFotoWidth;
  double? produtoFotoHeight;
  ScrollController? scrollController;
  RxBool? mostrarBotaoResetScroll;

  LayoutBuilderModel({
    this.produtoTituloFontSize,
    this.produtoSubTituloFontSize,
    this.produtoInfoAdicionalFontSize,
    this.botaoComprarWidth,
    this.botaoComprarHeight,
    this.botaoComprarFontSize,
    this.produtoFotoWidth,
    this.produtoFotoHeight,
    this.scrollController,
  }) {
    this.scrollController ??= ScrollController();
    mostrarBotaoResetScroll ??= false.obs;
  }
}
