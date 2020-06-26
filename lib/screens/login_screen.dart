import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(40),
          child: SingleChildScrollView(
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
                  onSaved: (String value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String value) {
                    return value.contains('@') ? 'Do not use the @ char.' : null;
                  },
                ),
                TextFormField(
                  cursorColor: pinkColor,
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
                  onSaved: (String value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String value) {
                    return value.contains('@') ? 'Do not use the @ char.' : null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                //TODO:
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
                Container(
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
    );
  }
}
