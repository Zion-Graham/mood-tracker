import 'package:flutter/material.dart';
import 'package:mood_tracker/models/EntryList.dart';
import 'package:mood_tracker/pages/pickMood.dart';
import 'package:mood_tracker/widgets/entryCard.dart';
import 'package:provider/provider.dart';

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
        body: Consumer<EntryList>(builder: (context, entryList, child) {
          return ListView.builder(
              itemCount: entryList.entries.length,
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (BuildContext context, int index) {
                return entryList.entries
                    .map((e) => EntryCard(entry: e))
                    .toList()[index];
              });
        }));
  }
}
