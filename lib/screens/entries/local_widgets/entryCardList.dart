import 'package:flutter/material.dart';
import 'package:mood_tracker/providers/EntryList.dart';
import 'package:mood_tracker/screens/entries/local_widgets/entryCard.dart';
import 'package:provider/provider.dart';

class EntryCardList extends StatelessWidget {
  const EntryCardList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EntryList>(
        builder: (context, entryList, child) => ListView.builder(
            itemCount: entryList.entries.length,
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (BuildContext context, int index) => entryList.entries
                .map((e) => EntryCard(entry: e))
                .toList()[index]));
  }
}
