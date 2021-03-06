import 'package:flutter/material.dart';
import 'package:mood_tracker/models/Entry.dart';
import 'package:mood_tracker/models/Moods.dart';
import 'package:mood_tracker/screens/pickEmotions/pickEmotions.dart';

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
                  builder: (context) => PickEmotions(
                        entry: entry,
                      )));
        },
        child: Image.asset(
          moods[mood],
        ),
      ),
      Container(padding: EdgeInsets.only(top: 10), child: Text(mood))
    ]);
  }
}
