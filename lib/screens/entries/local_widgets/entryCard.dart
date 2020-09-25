import 'package:flutter/material.dart';
import 'package:mood_tracker/models/Entry.dart';
import 'package:mood_tracker/models/Moods.dart';

class EntryCard extends StatelessWidget {
  const EntryCard({Key key, this.entry}) : super(key: key);
  final Entry entry;

  @override
  Widget build(BuildContext context) => Card(
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          moodAndDate(entry.mood, entry.created),
          Container(color: Colors.grey, height: 1),
          chipRow('Emotions', entry.emotions.map((e) => e.name).toList(),
              Colors.blue),
          Container(color: Colors.grey, height: 1),
          chipRow('Activities', entry.activities.map((e) => e.name).toList(),
              Colors.orange)
        ]),
      ));
}

// Helper Methods
Container moodAndDate(mood, date) => Container(
    margin: EdgeInsets.only(bottom: 5),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            height: 80,
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Image.asset(
              moods[mood],
            )),
        Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    child: Text(
                  // TODO: Format date like -> 'THURSDAY, MAY 21, 3:00 PM',
                  date.toString(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
                Container(
                    child: Text(
                  mood,
                  style: TextStyle(fontSize: 36),
                )),
              ]),
        )
      ],
    ));

// Returns a row containing a title
// followed by a scrollable list of chips
Row chipRow(String title, List<String> words, Color chipColor) {
  if (words.isEmpty) return Row();
  return Row(
    children: <Widget>[
      Container(
          margin: EdgeInsets.only(right: 5),
          child: Text(
            "$title:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )),
      Expanded(
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: chips(words, chipColor))))
    ],
  );
}

// Returns a list of containers containing
// chips with the same color
List<Container> chips(List<String> words, Color chipColor) => words
    .map((word) => Container(
        margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
        child: Chip(
            backgroundColor: chipColor,
            label: Text(
              word,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ))))
    .toList();
