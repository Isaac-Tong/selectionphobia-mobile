import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'package:selectionphobiamobile/networking/settingsNetworking.dart';
import 'package:selectionphobiamobile/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userInfo();
  }

  String username = 'Loading...';
  String email = 'Loading...';
  void userInfo() async{

    Map userData = await getUserInfo();
    setState(() {
      username = userData['username'];
      email = userData['email'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: lightblueColor,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Image(
                          image: AssetImage('assets/images/profile.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          username,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          email,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            color: darkblueColor,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.06),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(4,
                          4), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Developers',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Isaac Tong (Mobile, Frontend, Backend)',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: darkblueColor,
                      ),
                    ),
                    Text(
                      'Tom Jiao (Frontend, Backend)',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: darkblueColor,
                      ),
                    ),
                    Text(
                      'David Yei (Frontend, Backend)',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: darkblueColor,
                      ),
                    ),
                    Text(
                      'Andrew Liu (Frontend)',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: darkblueColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    margin: EdgeInsets.all(20),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        onTap: () async {
                          //Remove token from shared preferences
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.remove('token');

                          //Navigate to the login page
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                                (Route<dynamic> route) => false,
                          );
                        },
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Logout',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
