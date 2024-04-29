import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget sBody;
  final Widget mBody;
  final Widget lBody;

  const ResponsiveLayout({
    super.key,
    required this.sBody,
    required this.mBody,
    required this.lBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600)
          return sBody;
        else if (constraints.maxWidth < 1220)
          return mBody;
        else
          return lBody;
      },
    );
  }
}
