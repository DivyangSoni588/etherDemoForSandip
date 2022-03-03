import 'package:flutter/material.dart';
import 'screens/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // backgroundColor: const Color(0xFF222222),
        scaffoldBackgroundColor: Colors.black,
        hintColor: const Color.fromRGBO(168, 168, 168, 1),
      ),
      home: const LandingPage(),
    );
  }
}
