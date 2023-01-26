import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fmea/auth/screens/main_auth_page.dart';
import 'package:fmea/widgets/utils_widget.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData().copyWith(
          colorScheme: ThemeData(useMaterial3: true,).colorScheme.copyWith(
                brightness: Brightness.light,
                secondary: Colors.deepOrange[300],
                primary: Colors.teal[300],
              ),
        ),
        home: const MainAuthPage(),
      );
}
