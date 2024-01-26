import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/extensions/build_context.dart';
import 'package:todo/model/state_model.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController? controller;
  const SearchBox({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StateModel>(builder: (context, model, child) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
            decoration: BoxDecoration(
                color: context.isDarkMode
                    ? Theme.of(context).colorScheme.onSecondary
                    : Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(50)),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: TextField(
              controller: controller,
              onChanged: (value) => model.searchTodos(value),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search, size: 20),
                prefixIconConstraints: const BoxConstraints(
                    maxHeight: 40, maxWidth: 30, minHeight: 40, minWidth: 30),
                iconColor: Theme.of(context).colorScheme.onSecondaryContainer,
                hintText: "Search",
                hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
              ),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer),
            )),
      );
    });
  }
}
