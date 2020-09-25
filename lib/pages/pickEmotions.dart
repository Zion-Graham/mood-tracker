import 'package:flutter/material.dart';
import 'package:mood_tracker/models/ActivityList.dart';
import 'package:mood_tracker/models/Emotion.dart';
import 'package:mood_tracker/models/EmotionList.dart';
import 'package:mood_tracker/models/Entry.dart';
import 'package:mood_tracker/pages/pickActivities.dart';
import 'package:provider/provider.dart';

class PickEmotions extends StatefulWidget {
  final Entry entry;
  const PickEmotions({Key key, this.entry}) : super(key: key);

  @override
  _PickEmotionsState createState() => _PickEmotionsState();
}

class _PickEmotionsState extends State<PickEmotions> {
  @override
  Widget build(BuildContext context) {
    double verticalPadding = 40;
    return Scaffold(
      appBar: AppBar(title: Text('App')),
      body: Container(
          child: Column(children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: verticalPadding),
            child: Text(
              'How are you feeling?',
              style: TextStyle(fontSize: 36),
              textAlign: TextAlign.center,
            )),
        Expanded(
            child: Consumer<EmotionList>(
                builder: (context, emotionList, child) => ListView(
                    children: emotionList.emotions
                        .map(buildEmotionCheckBoxListTile)
                        .toList()))),
        Container(
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          child: RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MultiProvider(
                                providers: [
                                  ChangeNotifierProvider(
                                      create: (context) => ActivityList()),
                                ],
                                child: PickActivites(
                                  entry: widget.entry,
                                ))));
              },
              child: const Text('Continue', style: TextStyle(fontSize: 20))),
        ),
      ])),
    );
  }

  Widget buildEmotionCheckBoxListTile(Emotion emotion) => CheckboxListTile(
        title: Text(emotion.name),
        onChanged: (bool checked) => setState(() => {
              if (checked)
                {widget.entry.emotions.add(emotion)}
              else
                {widget.entry.emotions.remove(emotion)}
            }),
        value: widget.entry.emotions.contains(emotion),
      );
}
