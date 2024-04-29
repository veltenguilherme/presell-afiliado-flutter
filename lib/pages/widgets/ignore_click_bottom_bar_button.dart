import 'package:flutter/widgets.dart';

class IgnoreClickingBottomBarBackButton extends StatelessWidget {
  final Widget child;

  const IgnoreClickingBottomBarBackButton({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => false,
      child: child,
    );
  }
}
