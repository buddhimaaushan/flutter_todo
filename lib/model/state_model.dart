import 'package:flutter/material.dart';
import 'package:todo/model/history.dart';
import 'package:todo/model/todo.dart';

class StateModel extends ChangeNotifier {
  static Color _defaultThemeColor = const Color.fromARGB(255, 0, 137, 250);
  Color get primaryColor {
    return _defaultThemeColor;
  }

  set primaryColor(Color color) {
    _defaultThemeColor = color;
    notifyListeners();
  }

  static List<History> _historyItems = [];

  List<History> get historyItems {
    return _historyItems;
  }

  void _addHistoryItem(History item) {
    if (_historyItems.length >= 100) {
      _historyItems.removeLast();
    }
    _historyItems.insert(0, item);
    notifyListeners();
  }

  void removeHistoryItem(History item) {
    _historyItems.remove(item);
    notifyListeners();
  }

  void clearHistory() {
    _historyItems = [];
    notifyListeners();
  }

  static List<Todo> todos = [];

  static RegExp searchText = RegExp('');

  List<Todo> _searchTodos() {
    return todos.where((todo) => searchText.hasMatch(todo.title)).toList();
  }

  void searchTodos(String search) {
    searchText = RegExp(r'' + search, caseSensitive: false);
    notifyListeners();
  }

  List<Todo> get todoItems {
    return _searchTodos();
  }

  void toggleTodo(Todo todo) {
    todo.done = !todo.done;
    _addHistoryItem(
        History(action: todo.done ? "Done" : "Undone", desc: todo.title));
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    todos.remove(todo);
    _addHistoryItem(History(action: "Deleted", desc: todo.title));
    notifyListeners();
  }

  void addTodo(Todo todo) {
    todos.add(todo);
    _addHistoryItem(History(action: "Added", desc: todo.title));
    notifyListeners();
  }
}
