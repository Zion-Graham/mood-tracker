import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mood_tracker/models/Emotion.dart';
import 'package:mood_tracker/providers/ActivityList.dart';
import 'package:mood_tracker/providers/EmotionList.dart';
import 'package:provider/provider.dart';
import 'models/Activity.dart';
import 'models/Entry.dart';
import 'providers/EntryList.dart';
import 'screens/entries/entries.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.registerAdapter(EntryAdapter());
  Hive.registerAdapter(EmotionAdapter());
  Hive.registerAdapter(ActivityAdapter());
  Hive.init(appDocumentDir.path);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
            home: FutureBuilder(
                future: Hive.openBox<Entry>("entries"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError)
                      return Text(snapshot.error.toString());
                    else
                      return EntriesPage();
                  } else {
                    return Scaffold();
                  }
                })));
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
