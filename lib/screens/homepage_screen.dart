import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'myposts_pageview.dart';
import 'trendingposts_listview.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: pinkColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image(
                                image: AssetImage('./assets/images/prof-pic-temp.jpg'),
                              ),
                            ),
                          ),
                        ),
//                        CircleAvatar(
//                          radius: 30,
//                          backgroundImage:
//                              AssetImage('assets/images/prof-pic-temp.jpg'),
//                        ),
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
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textBaseline: TextBaseline.ideographic,
                children: <Widget>[
                  Text(
                    'My posts',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      color: pinkColor,
                    ),
                  ),
                ],
              ),
              Expanded(flex: 4, child: MyPostPageView()),
              SizedBox(
                height: 10,
              ),
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
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 8,
                child: TrendingPosts(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
