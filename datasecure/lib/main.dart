import 'package:datasecure/screens/Auth/login_screen.dart';
import 'package:datasecure/screens/monoalphabetic_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF7ebafe),
          primaryIconTheme: IconThemeData(color: Colors.white),
    ),

      home: LoginScreen(),
    );

  }
}

