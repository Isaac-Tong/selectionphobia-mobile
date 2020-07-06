import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'myposts_pageview.dart';
import 'trendingposts_listview.dart';
import 'package:selectionphobiamobile/networking/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'askQuestion_screen.dart';
import '../networking/homepage.dart';


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


  Future<Null> refreshPage() async{

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
        onPressed: (){
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
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
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
                        InkWell(
                          onTap: () {

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
                      ],
                    ),
                    Expanded(flex: 4, child: MyPostPageView(initialVar)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'New Posts',
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
          ),
        ),
      ),
    );
  }
}
