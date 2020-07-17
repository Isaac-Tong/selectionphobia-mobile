import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'package:selectionphobiamobile/screens/vote_screen.dart';
import 'myposts_pageview.dart';
import 'trendingposts_listview.dart';
import 'package:selectionphobiamobile/networking/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'askQuestion_screen.dart';
import '../networking/homepage.dart';
import 'package:selectionphobiamobile/screens/myPosts.dart';
import 'package:selectionphobiamobile/networking/newQuestion.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map questionMap;
  Map newMap;
  int newListCount = 5;
  var initialVar;

  String tempText =
      'There are many ways for us to do that beacuse I think that we';

  @override
  void initState() {
    super.initState();
    buildNewList();
    buildPageView();
  }

  void buildPageView() async {
    questionMap = await recentQuestionsGet();
    setState(() {
      initialVar = questionMap;
    });
  }

  void buildNewList() async {
    Map tempMap = await newQuestion();
    setState(() {
      newListCount = tempMap['title'].length;
      newMap = tempMap;
    });
  }

  Future<Null> refreshPage() async {
    questionMap = await recentQuestionsGet();
    setState(() {
      initialVar = questionMap;
    });
    return null;
  }

  List<Widget> buildIndicator() {
    List<Widget> indicatorList = [];
    for (int i = 0; i < 2; i++) {
      if (i == currentIndex) {
        indicatorList.add(createIndicator(true));
      } else {
        indicatorList.add(createIndicator(false));
      }
    }

    return indicatorList;
  }

  Widget createIndicator(bool isCurrent) {
    Color activeColor = Colors.transparent;
    double width = 25;
    if (isCurrent) {
      activeColor = Colors.deepOrangeAccent;
      width = 15;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 7.0,
      width: width,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      decoration: BoxDecoration(
        color: activeColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }

  int currentIndex = 0;

  PageController pageController = PageController(initialPage: 0);

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
                      height: 10,
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                pageController.animateToPage(0,
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.easeOut);
                              },
                              child: Text(
                                'New',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                pageController.animateToPage(1,
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.easeOut);
                              },
                              child: Text(
                                'Tags',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: buildIndicator(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 8,
                      child: PageView(
                        controller: pageController,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        children: <Widget>[
                          ListView.builder(
                            itemCount: newListCount,
                            itemBuilder: (BuildContext context, int index) {
                              if (newMap == null) {
                                return Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 15, 20),
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.12),
                                          spreadRadius: 4,
                                          blurRadius: 10,
                                          offset: Offset(4,
                                              4), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey[200],
                                      highlightColor: Colors.grey[300],
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7)),
                                                ),
                                                width: 100,
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.remove_red_eye,
                                                color: Colors.deepOrangeAccent,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7)),
                                                ),
                                                width: 30,
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }

                              String title = newMap['title'][index]['title'];
                              String totalVotes = newMap['title'][index]
                                      ['totalVotes']
                                  .toString();
                              String _id = newMap['title'][index]['_id'];
                              return Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 15, 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.12),
                                      spreadRadius: 4,
                                      blurRadius: 10,
                                      offset: Offset(
                                          4, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(8),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VoteScreen(_id)),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(
                                              title,
                                              style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.poll,
                                                color: Colors.deepOrangeAccent,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                totalVotes,
                                                style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 15,
                                                    color: Colors
                                                        .deepOrangeAccent),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          ListView(
                            padding: EdgeInsets.only(right: 15),
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.08),
                                              spreadRadius: 4,
                                              blurRadius: 7,
                                              offset: Offset(4,
                                                  4), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Lorem Ipsum',
                                              style: TextStyle(
                                                fontFamily: 'Lato',
                                                color: Colors.deepOrangeAccent,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  '404,100 posts',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: Container(
                                                        child: Image(
                                                          height: 40,
                                                          image: AssetImage(
                                                            'assets/images/life_style.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.08),
                                              spreadRadius: 4,
                                              blurRadius: 7,
                                              offset: Offset(4,
                                                  4), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Lorem Ipsum',
                                              style: TextStyle(
                                                fontFamily: 'Lato',
                                                color: Colors.deepOrangeAccent,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  '404,100 posts',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: Container(
                                                        child: Image(
                                                          height: 40,
                                                          image: AssetImage(
                                                            'assets/images/life_style.png',
                                                          ),
                                                        ),
                                                      ),
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
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.08),
                                              spreadRadius: 4,
                                              blurRadius: 7,
                                              offset: Offset(4,
                                                  4), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Lorem Ipsum',
                                              style: TextStyle(
                                                fontFamily: 'Lato',
                                                color: Colors.deepOrangeAccent,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  '404,100 posts',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: Container(
                                                        child: Image(
                                                          height: 40,
                                                          image: AssetImage(
                                                            'assets/images/life_style.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.08),
                                              spreadRadius: 4,
                                              blurRadius: 7,
                                              offset: Offset(4,
                                                  4), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Lorem Ipsum',
                                              style: TextStyle(
                                                fontFamily: 'Lato',
                                                color: Colors.deepOrangeAccent,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  '404,100 posts',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: Container(
                                                        child: Image(
                                                          height: 40,
                                                          image: AssetImage(
                                                            'assets/images/life_style.png',
                                                          ),
                                                        ),
                                                      ),
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
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.08),
                                              spreadRadius: 4,
                                              blurRadius: 7,
                                              offset: Offset(4,
                                                  4), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Lorem Ipsum',
                                              style: TextStyle(
                                                fontFamily: 'Lato',
                                                color: Colors.deepOrangeAccent,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  '404,100 posts',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: Container(
                                                        child: Image(
                                                          height: 40,
                                                          image: AssetImage(
                                                            'assets/images/life_style.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.08),
                                              spreadRadius: 4,
                                              blurRadius: 7,
                                              offset: Offset(4,
                                                  4), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Lorem Ipsum',
                                              style: TextStyle(
                                                fontFamily: 'Lato',
                                                color: Colors.deepOrangeAccent,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  '404,100 posts',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: Container(
                                                        child: Image(
                                                          height: 40,
                                                          image: AssetImage(
                                                            'assets/images/life_style.png',
                                                          ),
                                                        ),
                                                      ),
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

                            ],
                          ),
                        ],
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
