import 'package:flutter/material.dart';
import 'package:mood_tracker/models/Emotion.dart';

class EmotionList extends ChangeNotifier {
  Emotion emotion = Emotion("Test");
  List<Emotion> _emotions = [
    Emotion("Happy"),
    Emotion("Sad"),
    Emotion("Excited"),
    Emotion("Confused"),
    Emotion("Bored"),
    Emotion("Scared"),
  ];
  List<Emotion> get emotions => _emotions;

  void add(Emotion emotion) {
    _emotions.add(emotion);
    notifyListeners();
  }
}
