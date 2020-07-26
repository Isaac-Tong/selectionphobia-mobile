import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'package:selectionphobiamobile/screens/homepage_screen.dart';
import 'package:selectionphobiamobile/screens/login_screen.dart';
import 'package:selectionphobiamobile/screens/onboarding.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tokenCheck();
  }

  void tokenCheck() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Check to see if it is the first time launching the app;
    bool active = prefs.getBool('new');

    //Will be null if it is the first time
    //Will be true if it is not the first time. Then we must check if user has logged in or not.
    if(active != null){
      //Check if user has token stored
      var token = prefs.getString('token');
      if(token != null){
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new HomePage()));
        return;
      }
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new LoginScreen()));
      return;
    }

    //Then it is the first time that the user has run the app
    prefs.setBool('new', true);
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => new OnBoard()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                margin: EdgeInsets.symmetric(vertical: 15),
                padding: EdgeInsets.fromLTRB(20, 35, 20, 35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.09),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(4,
                          4), // changes position of shadow
                    ),
                  ],
                ),
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ],
          ),
          Text(
            'Selection Phobia',
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
              color: darkblueColor,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}