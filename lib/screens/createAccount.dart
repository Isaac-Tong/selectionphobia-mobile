import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String username = null;
  String password = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                height: 30,
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
                onChanged:(String value){
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
                onChanged:(String value){
                  username = value;
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
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
                onChanged:(String value){
                  username = value;
                },
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: darkblueColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Create your account',
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
