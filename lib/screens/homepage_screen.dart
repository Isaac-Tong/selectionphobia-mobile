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

  String tempText = 'There are many ways for us to do that beacuse I think that we';

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


  List<Widget> buildIndicator(){
    List<Widget> indicatorList = [];
    for (int i = 0; i < 2; i++) {
      if(i == currentIndex){
        indicatorList.add(createIndicator(true));
      }else{
        indicatorList.add(createIndicator(false));
      }
    }

    return indicatorList;
  }
  Widget createIndicator(bool isCurrent){
    Color activeColor = Colors.transparent;
    double width = 25;
    if(isCurrent){
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
                                pageController.animateToPage(0, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
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
                                pageController.animateToPage(1, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
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
                        onPageChanged: (index){
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        children: <Widget>[
                          ListView.builder(
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
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
                                  child: Row(
                                    children: <Widget>[
                                      Flexible(
                                        child: Text(
                                          tempText,
                                          style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.deepOrangeAccent,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '980',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 15,
                                            color: Colors.deepOrangeAccent),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.only(right: 15, bottom: 15),
                                height: 125,
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
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'Lorem Ipsum',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    color: darkblueColor,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 5,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          '404,100 posts',
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 9,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: <Widget>[
                                                        FittedBox(
                                                          fit: BoxFit.fill,
                                                          child: Image(
                                                            image: AssetImage(
                                                              'assets/images/life_style.png',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
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
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'Lorem Ipsum',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    color: darkblueColor,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 5,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          '404,100 posts',
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 9,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: <Widget>[
                                                        FittedBox(
                                                          fit: BoxFit.fill,
                                                          child: Image(
                                                            image: AssetImage(
                                                              'assets/images/life_style.png',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
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