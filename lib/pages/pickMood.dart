import 'package:flutter/material.dart';
import 'package:mood_tracker/models/EmotionList.dart';
import 'package:mood_tracker/models/Entry.dart';
import 'package:mood_tracker/models/MoodImage.dart';
import 'package:mood_tracker/pages/pickEmotions.dart';
import 'package:provider/provider.dart';

class PickMood extends StatefulWidget {
  @override
  _PickMoodState createState() => _PickMoodState();
}

class _PickMoodState extends State<PickMood> {
  Entry entry = Entry('', '', [], []);
  @override
  Widget build(BuildContext context) {
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
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: moodImages.map(buildMoodImage).toList(),
          ),
        ),
      ]),
    );
  }

  Expanded buildMoodImage(MoodImage moodImage) => Expanded(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(children: [
              InkWell(
                onTap: () {
                  entry.mood = moodImage.mood;
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
                  moodImage.image,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(moodImage.mood))
            ])),
      );
}
