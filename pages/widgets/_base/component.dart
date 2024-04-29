import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'component_controller.dart';

abstract class Component<TController extends ComponentController>
    extends StatelessWidget {
  Component({Key? key}) : super(key: key);

  late final TController controller = getController();

  @override
  Widget build(BuildContext context) {
    final initialize$ = controller.checkInitialize();

    KeyboardVisibilityController().onChange.listen((bool visible) {
      visible ? onKeyboardVisible(context) : onKeyboardHidden(context);
    });

    return FutureBuilder(builder: _builder, future: initialize$);
  }

  TController getController();
  Widget buildContent(BuildContext context);

  Widget _builder(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError) return buildError(context, snapshot);

    return buildContent(context);
  }

  Widget buildError(BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
      ErrorWidget(snapshot.error.toString());

  onKeyboardVisible(context) => controller.keyboardVisible(true);

  onKeyboardHidden(context) => controller.keyboardVisible(false);
}
