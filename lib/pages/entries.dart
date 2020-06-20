import 'package:flutter/material.dart';
import '../widgets/entry.dart';

class EntriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Entries'),
        ),
        body: ListView.builder(
            itemCount: 2,
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (BuildContext context, int index) {
              return Entry();
            }));
  }
}
final moods = ['Great', 'Good', 'Neutral', 'Bad', 'Awful'];
final emotions = ['Happy', 'Excited', 'Sad', 'Bored', 'Mad'];