import 'package:flutter/material.dart';
import 'package:mood_tracker/providers/EntryList.dart';
import 'package:mood_tracker/screens/entries/local_widgets/entryCard.dart';
import 'package:provider/provider.dart';

import 'dismissAlert.dart';

class EntryCardList extends StatelessWidget {
  const EntryCardList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EntryList>(
        builder: (context, entryList, child) => ListView(
            padding: const EdgeInsets.all(8.0),
            children: entryList.entries
                .map((e) => Dismissible(
                    background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        child: LayoutBuilder(
                            builder: (context, constraint) => Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.delete,
                                    size: constraint.biggest.height * 0.5)))),
                    direction: DismissDirection.endToStart,
                    dismissThresholds: {DismissDirection.endToStart: 0.2},
                    confirmDismiss: (DismissDirection direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DismissAlert();
                        },
                      );
                    },
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        entryList.remove(e);
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                              Text("Entry deleted"),
                              InkWell(
                                child: Text("Undo"),
                                onTap: () => entryList.add(e),
                              )
                            ])));
                      }
                    },
                    key: ValueKey(e.id),
                    child: EntryCard(entry: e)))
                .toList()));
  }
}
