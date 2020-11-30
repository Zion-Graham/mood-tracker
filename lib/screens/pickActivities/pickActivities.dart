import 'package:flutter/material.dart';
import 'package:mood_tracker/models/Activity.dart';
import 'package:mood_tracker/providers/ActivityList.dart';
import 'package:mood_tracker/models/Entry.dart';
import 'package:provider/provider.dart';
import 'local_widgets/finishButton.dart';

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
          Expanded(child: buildActivityPicker()),
          FinishButton(verticalPadding: verticalPadding, entry: widget.entry)
        ],
      )),
    );
  }

  Consumer<ActivityList> buildActivityPicker() {
    final ScrollController scrollController = ScrollController();
    return Consumer<ActivityList>(
        builder: (context, activityList, child) => Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Scrollbar(
                controller: scrollController,
                isAlwaysShown: true,
                child: ListView(
                    controller: scrollController,
                    children: activityList.activities
                        .map(buildActivityCheckBoxListTile)
                        .toList()))));
  }

  Widget buildActivityCheckBoxListTile(Activity activity) => CheckboxListTile(
        title: Text(activity.name),
        onChanged: (bool checked) => setState(() {
          if (checked) {
            widget.entry.activities.add(activity);
          } else {
            widget.entry.activities.remove(activity);
          }
        }),
        value: widget.entry.activities.any((a) => a.id == activity.id),
      );
}
