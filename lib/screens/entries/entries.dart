import 'package:flutter/material.dart';
import 'package:mood_tracker/screens/pickMood/pickMood.dart';
import 'local_widgets/entryCardList.dart';

class EntriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PickMood()));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('Entries'),
        ),
        body: EntryCardList());
  }
}
