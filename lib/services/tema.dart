import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'di_container.dart';

final tema = DiContainer.resolve<TemaService>();

class TemaService {
  final vermelho = HexColor("#F13B3B");
  final secondary75 = HexColor("#CCCFD2");
  final branco = Colors.white;
  final preto = Colors.black;
  final transparente = Colors.transparent;
  final grey50 = HexColor("#FAFAFA");

  MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }
}
