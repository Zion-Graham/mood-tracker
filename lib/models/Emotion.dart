import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'Emotion.g.dart';

@HiveType(typeId: 1)
class Emotion {
  @HiveField(0)
  final String id = Uuid().v4();
  @HiveField(1)
  final String name;

  Emotion(this.name);
}
