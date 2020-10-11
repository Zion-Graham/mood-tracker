import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:mood_tracker/models/Entry.dart';

class EntryList extends ChangeNotifier {
  SplayTreeSet<Entry> _entries = new SplayTreeSet();
  SplayTreeSet<Entry> get entries => _entries;

  void add(Entry entry) {
    _entries.add(entry);
    notifyListeners();
  }

  void remove(Entry entry) {
    _entries.remove(entry);
    notifyListeners();
  }
}
