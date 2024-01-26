import 'package:flutter/material.dart';

class D2xCol extends StatelessWidget {
  final List<Widget> children;
  const D2xCol({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(children: children);
  }
}
