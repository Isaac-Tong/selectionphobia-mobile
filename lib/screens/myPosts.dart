import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';


class MyPostsPage extends StatefulWidget {
  @override
  _MyPostsPageState createState() => _MyPostsPageState();
}

class _MyPostsPageState extends State<MyPostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'My Posts',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      color: greyColor,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: gradientColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),

                ),
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipsicing',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                                color: darkblueColor,
                                fontSize: 20,
                              ),

                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.whatshot,
                                color: Colors.deepOrangeAccent,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                'hot',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.deepOrangeAccent,

                                ),
                              ),
                            ],
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Text(
                                  'travel',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.poll,
                                    color: lightLightBlueColor,

                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '40,000',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 15,
                                      color: lightLightBlueColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: gradientColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),

                ),
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipsicing',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                                color: darkblueColor,
                                fontSize: 20,
                              ),

                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.whatshot,
                                color: Colors.deepOrangeAccent,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                'hot',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.deepOrangeAccent,

                                ),
                              ),
                            ],
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Text(
                                  'travel',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.poll,
                                    color: lightLightBlueColor,

                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '40,000',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 15,
                                      color: lightLightBlueColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: gradientColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),

                ),
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipsicing',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                                color: darkblueColor,
                                fontSize: 20,
                              ),

                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.whatshot,
                                color: Colors.deepOrangeAccent,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                'hot',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.deepOrangeAccent,

                                ),
                              ),
                            ],
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Text(
                                  'travel',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.poll,
                                    color: lightLightBlueColor,

                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '40,000',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 15,
                                      color: lightLightBlueColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
      ),
    );
  }
}
