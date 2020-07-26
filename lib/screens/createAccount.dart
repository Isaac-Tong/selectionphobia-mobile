import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'package:selectionphobiamobile/networking/create.dart';
import 'package:selectionphobiamobile/screens/homepage_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String username = null;
  String password = null;
  String email = null;
  String error = ' ';
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w900,
                      color: darkblueColor,
                      fontSize: 45,
                    ),
                  ),
                  Text(
                    'Create an account to continue.',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      AnimatedOpacity(
                        opacity: _visible ? 1 : 0,
                        duration: Duration(milliseconds: 200),
                        child: Text(
                          error,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    cursorColor: darkblueColor,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      focusColor: darkblueColor,
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lato',
                        fontSize: 17,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: darkblueColor),
                      ),
                    ),
                    onChanged: (String value) {
                      username = value;
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    cursorColor: darkblueColor,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      focusColor: Colors.red,
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lato',
                        fontSize: 17,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: darkblueColor),
                      ),
                    ),
                    onChanged: (String value) {
                      email = value;
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    obscureText: true,
                    cursorColor: darkblueColor,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      focusColor: Colors.red,
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lato',
                        fontSize: 17,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: darkblueColor),
                      ),
                    ),
                    onChanged: (String value) {
                      password = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: InkWell(
                          onTap: () async{
                            const url = "https://isaac-tong.github.io/selection_phobia_privacypolicy/";
                            if (await canLaunch(url)) {
                            await launch(url);
                            } else {
                            throw 'Could not launch $url';
                            }
                          },
                          borderRadius: BorderRadius.circular(3),
                          child: RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text:
                                          "By creating your account you agree to our "),
                                  TextSpan(
                                    text: "Terms of Service and Privacy Policy",
                                    style: TextStyle(
                                        color: darkblueColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: darkblueColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            onTap: () async {
                              try {
                                setState(() {
                                  _loadingVisible = true;
                                  Future.delayed(
                                      const Duration(milliseconds: 3000), () {
                                    setState(() {
                                      _loadingVisible = false;
                                    });
                                  });
                                });
                                await createPost(username, password, email);
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (Route<dynamic> route) => false,
                                );
                              } catch (e) {
                                if (mounted) {
                                  setState(() {
                                    error = e;
                                    _visible = true;
                                    Future.delayed(
                                        const Duration(milliseconds: 3000), () {
                                      setState(() {
                                        _visible = false;
                                      });
                                    });
                                  });
                                }
                              }
                            },
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  'create your account',
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
                          opacity: _loadingVisible ? 1 : 0,
                          duration: Duration(milliseconds: 200),
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballPulse,
                            color: darkblueColor,
                          ),
                        ),
                      ),
                    ],
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
