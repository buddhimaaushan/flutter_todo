import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/state_model.dart';
import 'package:todo/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateModel>(builder: (context, model, child) {
      return Expanded(
        child: ListView.builder(
            itemCount: model.todoItems.length,
            itemBuilder: (context, index) =>
                TodoItem(todo: model.todoItems[index])),
      );
    });
  }
}
