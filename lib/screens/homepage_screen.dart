import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'myposts_pageview.dart';
import 'trendingposts_listview.dart';
import 'package:selectionphobiamobile/networking/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'askQuestion_screen.dart';
import '../networking/homepage.dart';
import 'package:selectionphobiamobile/screens/myPosts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map questionMap;
  var initialVar;

  @override
  void initState() {
    super.initState();
    buildPageView();
  }

  void buildPageView() async {
    questionMap = await recentQuestionsGet();
    setState(() {
      initialVar = questionMap;
    });
  }

  Future<Null> refreshPage() async {
    questionMap = await recentQuestionsGet();
    setState(() {
      initialVar = questionMap;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.question_answer),
        label: Text('Ask'),
        backgroundColor: pinkColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AskQuestion()),
          );
        },
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refreshPage,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: darkGreyColor,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textBaseline: TextBaseline.ideographic,
                      children: <Widget>[
                        Text(
                          'My Posts',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: darkGreyColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyPostsPage()),
                              );
                            },
                            child: Text(
                              'View All',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: pinkColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(flex: 4, child: MyPostPageView(initialVar)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'New',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Tags',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.15),
                                    spreadRadius: 3,
                                    blurRadius: 15,
                                    offset: Offset(4, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Text(
                                      'There are many ways for us to do that beacuse I think that we',
                                      style: TextStyle(
                                        
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
