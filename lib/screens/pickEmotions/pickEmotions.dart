import 'package:flutter/material.dart';
import 'package:mood_tracker/models/Emotion.dart';
import 'package:mood_tracker/providers/EmotionList.dart';
import 'package:mood_tracker/models/Entry.dart';
import 'package:provider/provider.dart';

import 'local_widgets/continueButton.dart';

class PickEmotions extends StatefulWidget {
  const PickEmotions({Key key, this.entry}) : super(key: key);
  final Entry entry;

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
        Expanded(child: buildEmotionPicker()),
        ContinueButton(verticalPadding: verticalPadding, entry: widget.entry),
      ])),
    );
  }

  Consumer<EmotionList> buildEmotionPicker() {
    final ScrollController scrollController = ScrollController();
    return Consumer<EmotionList>(
        builder: (context, emotionList, child) => Scrollbar(
            controller: scrollController,
            isAlwaysShown: true,
            child: ListView(
                controller: scrollController,
                children: emotionList.emotions
                    .map(buildEmotionCheckBoxListTile)
                    .toList())));
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
