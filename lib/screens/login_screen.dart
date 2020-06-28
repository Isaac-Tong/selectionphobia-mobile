import 'dart:math';

import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'package:selectionphobiamobile/networking/login.dart';
import 'package:selectionphobiamobile/screens/homepage_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {





  String username = null;
  String password = null;
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image(
                        height: 150,
                        image: AssetImage('assets/images/yes-or-no.png')
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w900,
                          fontSize: 50,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      AnimatedOpacity(
                        opacity: _visible?1:0,
                        duration: Duration(milliseconds: 200),
                        child: Text(
                          'Wrong username/password',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    cursorColor: pinkColor,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      focusColor: Colors.red,
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lato',
                        fontSize: 20,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: pinkColor),
                      ),
                    ),
                    onChanged:(String value){
                      username = value;
                    },
                  ),
                  TextFormField(
                    cursorColor: pinkColor,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      focusColor: Colors.red,
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lato',
                        fontSize: 20,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: pinkColor),
                      ),
                    ),
                    onChanged:(String value){
                      password = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Forgot your password?',
                        style: TextStyle(
                          color: pinkColor,
                          fontFamily: 'Lato',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      //Send to networking page
                      try{
                        await loginPost(username, password);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (Route<dynamic> route) => false,
                      );
                      }catch(e){
                        print('error');
                        setState(() {
                          _visible = true;
                          Future.delayed(const Duration(milliseconds: 3000), () {
                            setState(() {
                              _visible = false;
                            });
                          });
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: pinkColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Create an account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: darkblueColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
