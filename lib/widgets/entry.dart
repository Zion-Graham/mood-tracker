import 'package:flutter/material.dart';

class Entry extends StatelessWidget {
  const Entry({Key key, this.mood, this.date}) : super(key: key);
  final DateTime date;
  final String mood;

  @override
  Widget build(BuildContext context) => Card(
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          moodAndDate(mood, date),
          Container(color: Colors.grey, height: 1),
          chipRow('Emotions', ["Happy", "Excited"], Colors.blue),
          Container(color: Colors.grey, height: 1),
          chipRow(
              'Activities', ["Programming", "Eating", "Sleping"], Colors.orange)
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
              'assets/emojis/png/001-happy.png',
            )),
        Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    child: Text(
                  date.toString(),
                  // 'THURSDAY, MAY 21, 3:00 PM',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
                Container(
                    child: Text(
                  'Great',
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
