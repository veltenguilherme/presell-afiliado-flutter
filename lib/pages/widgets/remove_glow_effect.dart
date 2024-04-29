import 'package:flutter/material.dart';

class RemoveGlowEffect extends StatelessWidget {
  final Widget child;
  const RemoveGlowEffect({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: child);
  }
}
