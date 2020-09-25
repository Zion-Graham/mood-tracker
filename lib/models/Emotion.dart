import 'package:uuid/uuid.dart';

class Emotion {
  final String id = Uuid().v4();
  final String name;

  Emotion(this.name);
}
