import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/state_model.dart';
import 'package:todo/widgets/todo_history_item.dart';

class TodoHistory extends StatefulWidget {
  const TodoHistory({super.key});

  @override
  State<TodoHistory> createState() => _TodoHistoryState();
}

class _TodoHistoryState extends State<TodoHistory> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StateModel>(builder: (context, model, child) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.2),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        const Text("History",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        const Spacer(flex: 1),
                        TextButton(
                            onPressed: () => model.clearHistory(),
                            child: const Text("Clear History"))
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: model.historyItems
                          .map((history) => TodoHistoryItem(history: history))
                          .toList(),
                    ),
                  )
                ]),
          ),
        ),
      );
    });
  }
}
