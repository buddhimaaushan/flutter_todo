import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/state_model.dart';
import 'package:todo/model/todo.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final textController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StateModel>(builder: (context, model, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Flexible(
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      hintText: "Add todo here...",
                      hintStyle: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                    ),
                    style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  )),
            ),
            const SizedBox(width: 10),
            IconButton.filled(
                onPressed: () => {
                      model.addTodo(Todo(title: textController.text)),
                      textController.clear()
                    },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.primary)),
                icon: Icon(Icons.add,
                    color: Theme.of(context).colorScheme.onPrimary, size: 30)),
          ],
        ),
      );
    });
  }
}
