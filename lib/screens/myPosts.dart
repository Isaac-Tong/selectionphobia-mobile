import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'package:selectionphobiamobile/networking/myPostsPageNetworking.dart';

class MyPostsPage extends StatefulWidget {
  @override
  _MyPostsPageState createState() => _MyPostsPageState();
}

class _MyPostsPageState extends State<MyPostsPage> {

  Map questionMap;
  int postCount = 5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buildQuestionCards();

  }
  void buildQuestionCards() async{
    questionMap = await getMyPosts();
    setState(() {
      postCount = questionMap['questions'].length;
      print(questionMap['questions'][0]['title']);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buildQuestionCards();
        },
      ),
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
              Expanded(
                child: ListView.builder(
                  itemCount: postCount,
                  itemBuilder: (context, index){
                    int backwardsIndex = postCount - index - 1;
                    String title = questionMap['questions'][backwardsIndex]['title'];
                    String description = questionMap['questions'][backwardsIndex]['description'];
                    String totalVotes = questionMap['questions'][backwardsIndex]['totalVotes'].toString();
                    return Container(
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
                                      color: Colors.grey,
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
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
