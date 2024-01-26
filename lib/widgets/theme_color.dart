import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/state_model.dart';

class ThemeColor extends StatelessWidget {
  final Color color;
  const ThemeColor(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap(context, color),
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: color),
          width: 25,
          height: 25,
        ),
      ),
    );
  }

  void _handleTap(BuildContext context, Color color) {
    final model = context.read<StateModel>();
    model.primaryColor = color;
  }
}
