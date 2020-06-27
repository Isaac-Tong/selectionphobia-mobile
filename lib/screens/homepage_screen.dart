import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'myposts_pageview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage('assets/images/prof-pic-temp.jpg'),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            '@isaact943',
                            style: TextStyle(
                              fontSize: 20,
                              color: darkblueColor,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image(
                    width: 30,
                    image: AssetImage('assets/images/search.png'),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    'My posts',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: MyPostPageView()),
              Row(
                children: <Widget>[
                  Text(
                    'Trending Posts',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
