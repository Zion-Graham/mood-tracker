import 'package:hive/hive.dart';

part 'Activity.g.dart';

@HiveType(typeId: 2)
class Activity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;

  Activity(this.name, this.id);
}
