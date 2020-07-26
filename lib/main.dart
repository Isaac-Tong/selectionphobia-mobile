import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/screens/askQuestion_screen.dart';
import 'package:selectionphobiamobile/screens/choice_screen.dart';
import 'package:selectionphobiamobile/screens/myposts_pageview.dart';
import 'package:selectionphobiamobile/screens/onboarding.dart';
import 'package:selectionphobiamobile/screens/option_menu.dart';
import 'package:selectionphobiamobile/screens/splash.dart';
import 'package:selectionphobiamobile/screens/tags_page.dart';
import 'screens/login_screen.dart';
import 'package:selectionphobiamobile/screens/homepage_screen.dart';
import 'screens/createAccount.dart';
import 'screens/vote_screen.dart';
import 'screens/myPosts.dart';
import 'screens/tags_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selection Phobia',
      home: SplashScreen(),
    );
  }
}

//TagsPage('Lifestyle')