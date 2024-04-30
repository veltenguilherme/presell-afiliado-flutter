import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/tema.dart';
import 'button.dart';

abstract class DialogBase {
  static buildHeader(Color? cor) => Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 5, right: 5),
      color: cor ?? tema.vermelho,
      height: 46,
      width: double.infinity,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "AVISO",
              style: TextStyle(
                  color: tema.branco,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.warning,
              color: tema.branco,
              size: 30,
            ),
          ]));

  static buildBody({message, widgetMessage}) => Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(12),
      child: widgetMessage ??
          Text(
            message,
            style: TextStyle(
              fontSize: 18,
              color: tema.preto,
            ),
          ));

  static buildButton(name, {Function? onPressed}) => Button(
        color: tema.transparente.obs,
        fontColor: tema.preto,
        fontWeight: FontWeight.bold,
        fontSize: 14,
        title: name,
        onPressed: onPressed ?? () => Navigator.pop(Get.context!),
        height: 30,
        width: 85,
      );
}
