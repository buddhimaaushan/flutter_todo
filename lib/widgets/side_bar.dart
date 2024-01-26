import 'package:flutter/material.dart';
import 'package:todo/widgets/themes.dart';
import 'package:todo/widgets/todo_history.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: const Column(
        children: [Themes(), TodoHistory()],
      ),
    );
  }
}
