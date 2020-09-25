import 'package:flutter/material.dart';
import 'package:mood_tracker/models/Entry.dart';
import 'package:mood_tracker/models/Moods.dart';

import 'moodImage.dart';

class MoodPicker extends StatelessWidget {
  const MoodPicker({
    Key key,
    @required this.entry,
  }) : super(key: key);

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: moods.keys
            .map((mood) => Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: MoodImage(entry: entry, mood: mood)),
                ))
            .toList(),
      ),
    );
  }
}
