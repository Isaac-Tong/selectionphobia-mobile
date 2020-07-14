import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/screens/askQuestion_screen.dart';
import 'package:selectionphobiamobile/screens/choice_screen.dart';
import 'package:selectionphobiamobile/screens/myposts_pageview.dart';
import 'package:selectionphobiamobile/screens/option_menu.dart';
import 'screens/login_screen.dart';
import 'package:selectionphobiamobile/screens/homepage_screen.dart';
import 'screens/createAccount.dart';
import 'screens/vote_screen.dart';
import 'screens/myPosts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selection Phobia',
      home: LoginScreen(),
    );
  }
}

