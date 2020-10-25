import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mood_tracker/models/Entry.dart';

class EntryList extends ChangeNotifier {
  final _entries = Hive.box<Entry>("entries");

  SplayTreeSet<Entry> get entries => SplayTreeSet.from(_entries.toMap().values);

  void add(Entry entry) {
    _entries.put(entry.id, entry);
    notifyListeners();
  }

  void remove(Entry entry) {
    _entries.delete(entry.id);
    notifyListeners();
  }
}
