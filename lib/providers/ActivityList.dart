import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mood_tracker/models/Activity.dart';

class ActivityList extends ChangeNotifier {
  final Box<Activity> _activities = Hive.box<Activity>("Activities");

  List<Activity> get activities => List.from(_activities.values);

  void add(Activity activity) {
    _activities.put(activity.id, activity);
    notifyListeners();
  }

  ActivityList() {
    List<Activity> _defaultActivities = [
      Activity('Programming', '011d1557-b762-4ff3-903c-64d2cb2b0147'),
      Activity('Exercising', 'f14dd916-d7c0-49cd-86af-fd826fce3b57'),
      Activity('Running', 'e032c84d-d814-4e1b-b0d1-ff4772553fce'),
      Activity('Hiking', '55a7e0b9-d8fa-4a57-bc03-cec970244955'),
      Activity('Gaming', '0db6c759-736a-486a-846d-1fe579060a51'),
      Activity('Shopping', '37eaf193-5306-45ac-ba38-7479f44081bf'),
      Activity('Sleeping', 'e86f0278-6689-46bb-8d26-7be1f041e589'),
      Activity('Eating', '9c877e45-7ad1-454c-93b0-f8ddb9077714'),
      Activity('Reading', 'd9a3191b-ec60-4bf3-b186-a55eb24bf675'),
      Activity('Working', 'f7d977c4-f668-450b-9c4b-7c49340e896e'),
      Activity('Socializing', 'a51c0ac0-6828-4a22-b258-8ebce1d46938'),
    ];
    _activities.putAll(Map.fromIterable(_defaultActivities,
        key: (activity) => activity.id, value: (activity) => activity));
  }
}
