import 'package:flutter/material.dart';
import 'package:mood_tracker/models/Entry.dart';
import 'package:mood_tracker/screens/pickActivities/pickActivities.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key key,
    @required this.verticalPadding,
    @required this.entry,
  }) : super(key: key);

  final double verticalPadding;
  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PickActivites(
                          entry: entry,
                        )));
          },
          child: const Text('Continue', style: TextStyle(fontSize: 20))),
    );
  }
}
