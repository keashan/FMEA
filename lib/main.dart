import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fmea/screens/summary_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              brightness: Brightness.light,
              secondary: Colors.deepOrange[300],
              primary: Colors.teal[300],
            ),
      ),
      home: const SummaryPage(),
    );
  }
}
