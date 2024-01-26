import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants/layout.dart';
import 'package:todo/extensions/build_context.dart';
import 'package:todo/layouts/desktop_layouts.dart';
import 'package:todo/layouts/responsive_layouts.dart';
import 'package:todo/model/state_model.dart';
import 'package:todo/widgets/add_todo.dart';
import 'package:todo/widgets/search_box.dart';
import 'package:todo/widgets/side_bar.dart';
import 'package:todo/widgets/todo_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: _buildAppBar(context),
        body: _buildHomeLayout(context),
        drawer: context.windowSize.width < desktopLayoutSize
            ? const Drawer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: SideBar(),
                ),
              )
            : null,
      ),
    );
  }

  PreferredSize _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        backgroundColor: Theme.of(context).colorScheme.background,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                "T O D O S",
                textAlign: TextAlign.center,
              )),
          const SizedBox(width: 20),
          SizedBox(
            width: 30,
            height: 30,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                    fit: BoxFit.cover,
                    "https://m.media-amazon.com/images/M/MV5BNWYwNjMxNzUtYmUzOS00MWE4LTgyM2YtN2JhMmM3MTk5NzUwXkEyXkFqcGdeQXVyMjYwNDA2MDE@._V1_.jpg")),
          )
        ]),
      ),
    );
  }

  Widget _buildHomeLayout(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < desktopLayoutSize) {
        return R1xCol(child: _buildAppBody(context));
      } else {
        return D2xCol(children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, bottom: 15),
            child: SideBar(),
          ),
          Expanded(child: _buildAppBody(context))
        ]);
      }
    });
  }

  Widget _buildAppBody(BuildContext context) {
    return Consumer<StateModel>(builder: (context, model, child) {
      return Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(children: [
          SearchBox(controller: searchTextController),
          model.todoItems.isEmpty
              ? Expanded(
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Text(
                      "Add Your Todos",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withOpacity(0.5)),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  )),
                )
              : const TodoList(),
          const AddTodo()
        ]),
      );
    });
  }
}
