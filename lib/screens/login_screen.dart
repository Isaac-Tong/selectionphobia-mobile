import 'dart:math';

import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'package:selectionphobiamobile/networking/login.dart';
import 'package:selectionphobiamobile/screens/homepage_screen.dart';
import 'package:selectionphobiamobile/screens/createAccount.dart';
import 'package:loading_indicator/loading_indicator.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {





  String username = null;
  String password = null;
  bool _visible = false;
  bool _loadingVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image(
                        height: 160,
                        image: AssetImage('assets/images/login.png')
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: pinkColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 45,
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
                      focusColor: Colors.redAccent,
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
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: pinkColor,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            onTap: () async {
                              //Send to networking page
                              try{
                                setState(() {
                                  _loadingVisible = true;
                                  Future.delayed(const Duration(milliseconds: 3000), () {
                                    setState(() {
                                      _loadingVisible = false;
                                    });
                                  });
                                });
                                await loginPost(username, password);
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomePage()),
                                      (Route<dynamic> route) => false,
                                );
                              }catch(e){
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
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  'login',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 25,
                        child: AnimatedOpacity(
                          opacity: _loadingVisible?1:0,
                          duration: Duration(milliseconds: 200),
                          child: LoadingIndicator(indicatorType: Indicator.ballPulse, color: pinkColor,),
                        ),
                      ),
                    ],
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateAccount()),
                      );
                    },
                    child: Text(
                      'Create an account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: darkblueColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
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
