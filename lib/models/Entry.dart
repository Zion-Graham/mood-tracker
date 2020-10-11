import 'package:uuid/uuid.dart';

import 'Activity.dart';
import 'Emotion.dart';

class Entry implements Comparable {
  String id = Uuid().v4();
  String description;
  String mood;
  List<Emotion> emotions;
  List<Activity> activities;
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
