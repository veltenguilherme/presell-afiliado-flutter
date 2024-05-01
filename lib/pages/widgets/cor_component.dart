import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_color_picker/web_color_picker.dart';

import '../../services/tema.dart';
import '_base/component_controller.dart';

class CorComponent extends StatelessWidget {
  final String titulo;
  final Rx<Color> cor;
  final Debounce debouncer = Debounce(milliseconds: 2500);

  CorComponent({
    super.key,
    required this.titulo,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) => WebColorPicker.builder(
      initialColor: cor.value,
      builder: (context, selectedColor) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          cor(tema.getMaterialColor(selectedColor!));
        });

        return ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 12,
            )),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: selectedColor)),
              const SizedBox(width: 8),
              Text(
                titulo,
              )
            ]));
      });
}
