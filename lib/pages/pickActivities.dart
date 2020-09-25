import 'package:flutter/material.dart';
import 'package:mood_tracker/models/Activity.dart';
import 'package:mood_tracker/models/ActivityList.dart';
import 'package:mood_tracker/models/Entry.dart';
import 'package:mood_tracker/models/EntryList.dart';
import 'package:provider/provider.dart';

class PickActivites extends StatefulWidget {
  const PickActivites({Key key, this.entry}) : super(key: key);
  final Entry entry;

  @override
  _PickActivitesState createState() => _PickActivitesState();
}

class _PickActivitesState extends State<PickActivites> {
  @override
  Widget build(BuildContext context) {
    double verticalPadding = 40;
    return Scaffold(
      appBar: AppBar(title: Text('App')),
      body: Container(
          child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: verticalPadding),
              child: Text(
                'What are you doing?',
                style: TextStyle(fontSize: 36),
                textAlign: TextAlign.center,
              )),
          Expanded(
              child: Consumer<ActivityList>(
                  builder: (context, activityList, child) => ListView(
                      children: activityList.activities
                          .map(buildActivityCheckBoxListTile)
                          .toList()))),
          Consumer<EntryList>(
              builder: (context, entryList, child) => Container(
                    padding: EdgeInsets.symmetric(vertical: verticalPadding),
                    child: RaisedButton(
                        onPressed: () {
                          Provider.of<EntryList>(context, listen: false)
                              .add(widget.entry);
                          Navigator.popUntil(context,
                              ModalRoute.withName(Navigator.defaultRouteName));
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ChangeNotifierProvider(
                          //             create: (context) => EntryList(),
                          //             child: EntriesPage())),
                          //     ModalRoute.withName(Navigator.defaultRouteName));
                        },
                        child: const Text('Finish',
                            style: TextStyle(fontSize: 20))),
                  ))
        ],
      )),
    );
  }

  Widget buildActivityCheckBoxListTile(Activity activity) => CheckboxListTile(
        title: Text(activity.name),
        onChanged: (bool checked) => setState(() => {
              if (checked)
                {widget.entry.activities.add(activity)}
              else
                {widget.entry.activities.remove(activity)}
            }),
        value: widget.entry.activities.contains(activity),
      );
}
