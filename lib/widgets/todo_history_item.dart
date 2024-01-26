import 'package:flutter/material.dart';
import 'package:todo/model/history.dart';
import 'package:timeago/timeago.dart' as timeago;

class TodoHistoryItem extends StatelessWidget {
  final History history;
  const TodoHistoryItem({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withOpacity(0.4)),
          child: Column(children: [
            Row(
              children: [
                Text(history.action,
                    style: const TextStyle(fontWeight: FontWeight.w500)),
                const Spacer(flex: 1),
                Text(timeago.format(history.dateTime),
                    style: const TextStyle(fontSize: 10))
              ],
            ),
            Divider(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                height: 20,
                thickness: 1),
            Row(
              children: [
                Text(history.desc, style: const TextStyle(fontSize: 10))
              ],
            )
          ])),
    );
  }
}
