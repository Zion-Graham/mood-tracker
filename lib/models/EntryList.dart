import 'package:flutter/material.dart';
import 'package:mood_tracker/models/Entry.dart';

class EntryList extends ChangeNotifier {
  List<Entry> _entries = [];
  List<Entry> get entries => _entries;

  void add(Entry entry) {
    _entries.add(entry);
    notifyListeners();
  }
}
