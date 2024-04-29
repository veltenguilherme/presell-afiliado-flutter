import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../services/di_container.dart';
import '../../services/tema.dart';
import 'dialogs/dialog_info.dart';
import 'ignore_click_bottom_bar_button.dart';
import 'spaces.dart';

final progressDialog = DiContainer.resolve<ProgressDialogService>();

class ProgressDialogService {
  Future<dynamic> tryRun(
    BuildContext context,
    Function function, {
    String text = "Validando informações...",
    bool multiLines = false,
    bool showMessage = false,
    double fontSize = 0,
  }) async {
    text = showMessage ? text : "";
    showProgressDialog(
      context,
      text: text,
      multiLines: multiLines,
      fontSize: fontSize,
    );

    try {
      return await function.call();
    } catch (e) {
      closeDialog(context: context);
      DialogInfo.show(context: context, message: e.toString());
    }
  }

  showProgressDialog(
    context, {
    text,
    multiLines = false,
    fontSize = 0,
  }) {
    fontSize = fontSize == 0 ? 5.1.w : fontSize;
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => IgnoreClickingBottomBarBackButton(
                child: SimpleDialog(
                    elevation: 0,
                    contentPadding: EdgeInsets.all(2.5.w),
                    children: <Widget>[
                  multiLines
                      ? _buildProgressDialogMultiLine(text, fontSize)
                      : _buildProgressDialogSingleLine(text, fontSize)
                ])));
  }

  _buildProgressDialogMultiLine(text, fontSize) {
    return Column(children: [
      _buildProgressDialogText(text, fontSize),
      Spaces(size: 2.w),
      _buildProgressDialogCircularProgressIndicator(),
    ]);
  }

  _buildProgressDialogSingleLine(text, fontSize) {
    return Center(
        child: Row(
            mainAxisAlignment: text.isNotEmpty
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
          _buildProgressDialogCircularProgressIndicator(),
          if (text.isNotEmpty) _buildProgressDialogText(text, fontSize),
        ]));
  }

  _buildProgressDialogText(text, fontSize) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w200),
    );
  }

  _buildProgressDialogCircularProgressIndicator() =>
      CircularProgressIndicator(color: tema.vermelho);

  closeDialog({BuildContext? context}) =>
      Navigator.of(context ?? Get.context!, rootNavigator: true).pop();
}
