import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'Activity.g.dart';

@HiveType(typeId: 2)
class Activity {
  @HiveField(0)
  final String id = Uuid().v4();
  @HiveField(1)
  final String name;

  Activity(this.name);
}
