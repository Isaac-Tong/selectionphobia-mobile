import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'package:selectionphobiamobile/networking/myPostsPageNetworking.dart';
import 'package:shimmer/shimmer.dart';
import 'package:selectionphobiamobile/screens/vote_screen.dart';

class MyPostsPage extends StatefulWidget {
  @override
  _MyPostsPageState createState() => _MyPostsPageState();
}

class _MyPostsPageState extends State<MyPostsPage> {
  Map questionMap;
  int postCount = 10;
  bool hasLoaded = false;
  bool noPosts = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buildQuestionCards();
  }

  void buildQuestionCards() async {
    questionMap = await getMyPosts();
    if(questionMap['questions'].length == 0){
      setState(() {
        noPosts = true;
        postCount = 1;
        hasLoaded = true;
      });
      return;
    };
    setState(() {
      hasLoaded = true;
      postCount = questionMap['questions'].length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'My Posts',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      color: darkGreyColor,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    var refreshedData = await getMyPosts();
                    setState(() {
                      questionMap = refreshedData;
                      hasLoaded = true;
                      postCount = questionMap['questions'].length;
                    });
                  },
                  child: ListView.builder(
                      itemCount: postCount,
                      itemBuilder: (context, index) {
                        //Load shimmer effect if data has not yet been loaded
                        if (hasLoaded == false) {
                          return Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            decoration: BoxDecoration(
                              color: gradientColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(18),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[200],
                                highlightColor: Colors.grey[300],
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          height: 15,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            color: gradientColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              height: 15,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: gradientColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              height: 15,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                color: gradientColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: 15,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                color: gradientColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              height: 25,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: gradientColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              height: 25,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                color: gradientColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
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
                          );
                        }
                        if(noPosts == true){
                          return Container(
                            child: Text(
                              'You have no posts',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          );
                        }
                        int backwardsIndex = postCount - index - 1;
                        String title =
                            questionMap['questions'][backwardsIndex]['title'];
                        String description = questionMap['questions']
                            [backwardsIndex]['description'];
                        String totalVotes = questionMap['questions']
                                [backwardsIndex]['totalVotes']
                            .toString();
                        String questionId =
                            questionMap['questions'][backwardsIndex]['_id'];
                        String tag = questionMap['questions'][backwardsIndex]
                                ['tags']
                            .toString();

                        //Remove square brackets using regex
                        String newTag = tag.replaceAll(RegExp("\\[|\\]"), '');
                        if (newTag == '') {
                          newTag = 'None';
                        }

                        List<Widget> contentColumn = [
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.bold,
                                    color: darkblueColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  description,
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.normal,
                                    color: darkGreyColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: darkGreyColor,
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Text(
                                      newTag,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.bold,
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
                                        totalVotes,
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
                          )
                        ];

                        //Logic for hot icon
                        if (questionMap['questions'][backwardsIndex]
                                ['totalVotes'] >=
                            4) {
                          contentColumn = [
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    title,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    description,
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.normal,
                                      color: darkGreyColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: darkGreyColor,
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      child: Text(
                                        newTag,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.bold,
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
                                          totalVotes,
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
                            )
                          ];
                        }

                        return Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          decoration: BoxDecoration(
                            color: gradientColor,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Container(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VoteScreen(
                                            questionMap['questions']
                                                [backwardsIndex]['_id'])),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(18),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: contentColumn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
