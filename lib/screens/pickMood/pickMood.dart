import 'package:flutter/material.dart';
import 'package:mood_tracker/models/Entry.dart';

import 'local_widgets/moodPicker.dart';

class PickMood extends StatefulWidget {
  final Entry entry;

  const PickMood({Key key, this.entry}) : super(key: key);

  @override
  _PickMoodState createState() => _PickMoodState();
}

class _PickMoodState extends State<PickMood> {
  @override
  Widget build(BuildContext context) {
    Entry entry = widget.entry ?? Entry('', '', [], []);
    return Scaffold(
      appBar: AppBar(title: Text('App')),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Center(
            child: Container(
          child: Text(
            entry.mood.isEmpty ? 'Pick a mood' : entry.mood,
            style: TextStyle(fontSize: 48),
          ),
        )),
        MoodPicker(entry: entry),
      ]),
    );
  }
}
