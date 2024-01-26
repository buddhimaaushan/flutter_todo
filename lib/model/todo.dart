import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Todo {
  String id = uuid.v8();
  String title;
  bool done;
  Todo({required this.title, this.done = false});
}
