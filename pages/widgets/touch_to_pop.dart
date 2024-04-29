import 'package:flutter/material.dart';

class TouchToPop extends StatelessWidget {
  final Widget child;

  const TouchToPop({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => Navigator.of(context, rootNavigator: true).pop(),
      child: child,
    );
  }
}
