import 'package:flutter/material.dart';
import 'package:mood_tracker/models/Entry.dart';
import 'package:mood_tracker/providers/EntryList.dart';
import 'package:provider/provider.dart';

class FinishButton extends StatelessWidget {
  const FinishButton({
    Key key,
    @required this.verticalPadding,
    @required this.entry,
  }) : super(key: key);

  final double verticalPadding;
  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return Consumer<EntryList>(
        builder: (context, entryList, child) => Container(
              padding: EdgeInsets.symmetric(vertical: verticalPadding),
              child: RaisedButton(
                  onPressed: () {
                    Provider.of<EntryList>(context, listen: false).add(entry);
                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
                  },
                  child: const Text('Finish', style: TextStyle(fontSize: 20))),
            ));
  }
}
