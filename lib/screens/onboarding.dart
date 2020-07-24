import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class OnBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.15),
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
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.navigate_next,
                                    color: darkblueColor,
                                  ),
                                  Icon(
                                    Icons.navigate_next,
                                    color: darkblueColor,
                                  ),
                                  Icon(
                                    Icons.navigate_next,
                                    color: darkblueColor,
                                  ),
                                ],
                              ),
                              Text(
                                'swipe to continue',
                                style: TextStyle(
                                  color: darkGreyColor,
                                  fontFamily: 'Lato'
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: gradientColor,
                      child: SafeArea(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Simply ask your question'
                            ),
                            Container(
                              padding: EdgeInsets.all(30),
                              color: Colors.white,
                              margin: EdgeInsets.all(40),
                              child: Image(
                                image: AssetImage('assets/images/onboard_vote.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
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
