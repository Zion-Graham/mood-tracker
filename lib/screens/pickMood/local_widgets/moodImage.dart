import 'package:flutter/material.dart';
import 'package:mood_tracker/providers/EmotionList.dart';
import 'package:mood_tracker/models/Entry.dart';
import 'package:mood_tracker/models/Moods.dart';
import 'package:mood_tracker/screens/pickEmotions/pickEmotions.dart';
import 'package:provider/provider.dart';

class MoodImage extends StatelessWidget {
  const MoodImage({Key key, @required this.entry, @required this.mood})
      : super(key: key);

  final Entry entry;
  final String mood;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: () {
          entry.mood = mood;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                      create: (context) => EmotionList(),
                      child: PickEmotions(
                        entry: entry,
                      ))));
        },
        child: Image.asset(
          moods[mood],
        ),
      ),
      Container(padding: EdgeInsets.only(top: 10), child: Text(mood))
    ]);
  }
}
