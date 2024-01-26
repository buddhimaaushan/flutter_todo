import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/state_model.dart';
import 'package:todo/screens/home.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => StateModel(),
    child: const TodoApp(),
  ));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<StateModel>(builder: (context, model, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.trackpad,
            PointerDeviceKind.touch,
          },
        ),
        title: 'Todo App',
        themeMode: ThemeMode.system,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.light, seedColor: model.primaryColor),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.dark, seedColor: model.primaryColor),
          useMaterial3: true,
        ),
        home: const Home(),
      );
    });
  }
}
