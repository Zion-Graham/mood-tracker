import 'package:flutter/material.dart';
import 'package:mood_tracker/providers/ActivityList.dart';
import 'package:mood_tracker/providers/EmotionList.dart';
import 'package:provider/provider.dart';
import 'providers/EntryList.dart';
import 'screens/entries/entries.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<EmotionList>(
            create: (context) => EmotionList(),
          ),
          ChangeNotifierProvider<ActivityList>(
            create: (context) => ActivityList(),
          ),
          ChangeNotifierProvider<EntryList>(
            create: (context) => EntryList(),
          ),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: EntriesPage()));
  }
}
