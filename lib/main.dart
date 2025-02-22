import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/note_database.dart';
import 'package:to_do_app/pages/notes_page.dart';
import 'package:to_do_app/pages/settings_page.dart';
import 'package:to_do_app/themes/theme_provider.dart';

void main() async {
  //Initialize the note isar database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NoteDatabase()),
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      child: const MyApp(),
      )
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/notes': (context) => const NotesPage(),
        '/settings': (context) => SettingsPage(),
      },
          );
  }
}
