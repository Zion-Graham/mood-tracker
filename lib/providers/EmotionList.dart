import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mood_tracker/models/Emotion.dart';

class EmotionList extends ChangeNotifier {
  final Box<Emotion> _emotions = Hive.box<Emotion>("emotions");

  List<Emotion> get emotions => List.from(_emotions.values);

  void add(Emotion emotion) {
    _emotions.put(emotion.id, emotion);
    notifyListeners();
  }

  EmotionList() {
    List<Emotion> _defaultEmotions = [
      Emotion("Happy", "55188aed-cabc-4d23-8436-9bab45c960c5"),
      Emotion("Sad", "464ef13e-da80-4a5c-92a7-a193be8ca6e6"),
      Emotion("Excited", "243fe173-a36d-4775-8ecb-65397e0e1945"),
      Emotion("Confused", "3ea19aff-843e-4753-9030-9bfa0affc055"),
      Emotion("Bored", "fab6da59-3125-4ceb-a068-ab3037605a8f"),
      Emotion("Scared", "6a17d6b6-8dc8-447d-a8ca-2ff79f1f7020"),
    ];
    _emotions.putAll(Map.fromIterable(_defaultEmotions,
        key: (emotion) => emotion.id, value: (emotion) => emotion));
  }
}
