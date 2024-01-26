import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/state_model.dart';
import 'package:todo/model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  const TodoItem({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StateModel>(builder: (context, model, child) {
      return Card(
        elevation: 0,
        child: ListTile(
          onTap: () => model.toggleTodo(todo),
          title: Text(todo.title,
              style: TextStyle(
                  decoration: todo.done
                      ? TextDecoration.lineThrough
                      : TextDecoration.none)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          tileColor: Theme.of(context)
              .colorScheme
              .primaryContainer
              .withOpacity(todo.done ? 0.2 : 0.4),
          leading: Icon(
              todo.done ? Icons.check_box : Icons.check_box_outline_blank,
              color: Theme.of(context).colorScheme.onPrimaryContainer),
          trailing: IconButton.filled(
              onPressed: () => model.deleteTodo(todo),
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.transparent)),
              icon: Icon(Icons.delete,
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.3),
                  size: 20)),
          contentPadding:
              const EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 20),
        ),
      );
    });
  }
}
