import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';

import 'Activity.dart';
import 'Emotion.dart';

part 'Entry.g.dart';

@HiveType(typeId: 0)
class Entry implements Comparable {
  @HiveField(0)
  String id = Uuid().v4();
  @HiveField(1)
  String description;
  @HiveField(2)
  String mood;
  @HiveField(3)
  List<Emotion> emotions;
  @HiveField(4)
  List<Activity> activities;
  @HiveField(5)
  DateTime created = DateTime.now();

  Entry(
    this.description,
    this.mood,
    this.emotions,
    this.activities,
  );

  @override
  int compareTo(other) {
    return this.created.compareTo(other.created);
  }
}
