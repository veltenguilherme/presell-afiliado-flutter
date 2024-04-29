import 'package:flutter/widgets.dart';

class Spaces extends StatelessWidget {
  final double size;
  const Spaces({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) =>
      SizedBox.fromSize(size: Size(size, size));
}
