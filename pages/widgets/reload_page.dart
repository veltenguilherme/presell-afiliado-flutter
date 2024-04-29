import 'package:flutter/material.dart';
import 'dart:html' as html;

import '../../services/tema.dart';

class ReloadPageComponent extends StatelessWidget {
  final Widget child;
  const ReloadPageComponent({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => RefreshIndicator(
      color: tema.vermelho,
      onRefresh: () async => html.window.location.reload(),
      child: child);
}
