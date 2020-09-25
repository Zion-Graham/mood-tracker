import 'package:flutter/material.dart';
import 'package:mood_tracker/models/Activity.dart';

class ActivityList extends ChangeNotifier {
  List<Activity> _activities = [
    Activity('Programming'),
    Activity('Exercising'),
    Activity('Running'),
    Activity('Hiking'),
    Activity('Gaming'),
    Activity('Shopping'),
    Activity('Sleeping'),
    Activity('Eating'),
    Activity('Reading'),
    Activity('Working'),
    Activity('Socializing'),
  ];
  List<Activity> get activities => _activities;

  void add(Activity entry) {
    _activities.add(entry);
    notifyListeners();
  }
}
