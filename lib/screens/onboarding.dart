import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'package:selectionphobiamobile/screens/homepage_screen.dart';
import 'package:selectionphobiamobile/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
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
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.15),
                  color: lightOrange,
                  child: Image(
                    image: AssetImage('assets/images/onboard_1.png'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Welcome to SelectionPhobia.',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.bold,
                                    color: darkblueColor,
                                    fontSize: 30,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Where your answers are answered by our community.',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.normal,
                                    color: darkGreyColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: darkblueColor,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => LoginScreen()),
                                    (Route<dynamic> route) => false,
                              );
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Get Started',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
