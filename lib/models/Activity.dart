import 'package:uuid/uuid.dart';

class Activity {
  final String id = Uuid().v4();
  final String name;

  Activity(this.name);
}
