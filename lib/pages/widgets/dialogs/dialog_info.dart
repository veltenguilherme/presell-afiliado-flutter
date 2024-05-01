import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/tema.dart';
import '_base.dart';

class DialogInfo {
  static show({
    BuildContext? context,
    message,
    widgetMessage,
    String botaoTexto = "ALTERAR",
    Color? cor,
    onPressed,
  }) =>
      showDialog<void>(
          context: context ?? Get.context!,
          builder: (BuildContext context) => SimpleDialog(
                  backgroundColor: tema.branco,
                  contentPadding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  children: <Widget>[
                    Column(children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // DialogBase.buildHeader(cor),
                            DialogBase.buildBody(
                              message: message,
                              widgetMessage: widgetMessage,
                            ),
                            // _buildButtons(botaoTexto, onPressed),
                          ])
                    ])
                  ]));

  // static _buildButtons(botaoTexto, onPressed) => Container(
  //     padding: const EdgeInsets.only(right: 2),
  //     child: DialogBase.buildButton(botaoTexto, onPressed: onPressed));
}
