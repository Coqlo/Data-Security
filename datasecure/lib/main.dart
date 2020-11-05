import 'package:datasecure/screens/Auth/registersuccess.dart';
import 'package:datasecure/screens/index_screen.dart';
import 'package:datasecure/screens/start_screen.dart';
import 'package:flutter/material.dart';

import 'screens/Auth/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF7ebafe)
      ),

      home: LoginScreen(),
    );

  }
}

