import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class History {
  String id = uuid.v8();
  String action;
  String desc;
  DateTime dateTime = DateTime.now();
  History({required this.action, required this.desc});
}
