import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../services/tema.dart';
import '../spaces.dart';

class Button extends StatelessWidget {
  final Rx<Color>? color;
  final String title;
  final double width;
  final double height;
  final double fontSize;
  final Function onPressed;
  final double borderRadius;
  final FontWeight fontWeight;
  final Alignment? gradientEnd;
  final Alignment? gradiendBegin;
  final List<Color>? gradiendColors;
  final double circularProgressWidth;
  final double circularProgressHeight;
  final Color? fontColor;
  final IconData? icon;
  final Color? splashColor;
  final BorderSide borderSide;
  const Button({
    super.key,
    required this.title,
    required this.color,
    required this.width,
    required this.height,
    required this.onPressed,
    this.gradiendColors,
    this.fontSize = 20,
    this.borderRadius = 5,
    this.fontWeight = FontWeight.w300,
    this.gradientEnd = Alignment.topRight,
    this.gradiendBegin = Alignment.center,
    this.circularProgressHeight = 40,
    this.circularProgressWidth = 40,
    this.fontColor = Colors.white,
    this.icon,
    this.splashColor = const Color.fromARGB(255, 248, 248, 248),
    this.borderSide = BorderSide.none,
  });

  @override
  Widget build(BuildContext context) => Obx(() => MaterialButton(
      padding: EdgeInsets.zero,
      minWidth: width,
      height: height,
      onLongPress: () => {},
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius), side: borderSide),
      splashColor: splashColor,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      onPressed: () async => await onPressed.call(),
      child: _buildInk()));

  _buildInk() => gradiendColors == null
      ? Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color?.value ?? Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          child: _buildTitle())
      : Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: gradiendBegin!,
                end: gradientEnd!,
                colors: gradiendColors!),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          child: _buildTitle());

  _buildTitle() => Center(
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon!,
                    color: tema.branco,
                    size: 1.5.w,
                  ),
                  const Spaces(size: 8),
                  _buildTitleText(),
                ],
              )
            : _buildTitleText(),
      );

  _buildTitleText() => Text(
        title,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
        ),
      );

  static buildDefault(
          {title,
          color,
          fontColor,
          fontSize,
          splashColor,
          onPressed,
          double width = 50,
          double height = 5}) =>
      Button(
          title: title,
          color: color,
          fontColor: fontColor,
          width: width.w,
          height: height,
          borderRadius: 0.5.w,
          fontSize: fontSize,
          splashColor: splashColor,
          fontWeight: FontWeight.bold,
          onPressed: () => onPressed.call());
}
