import 'package:hive/hive.dart';

part 'Emotion.g.dart';

@HiveType(typeId: 1)
class Emotion {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;

  Emotion(this.name, this.id);
}
