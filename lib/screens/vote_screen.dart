import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:selectionphobiamobile/networking/voteNetworking.dart';
import 'package:shimmer/shimmer.dart';

class VoteScreen extends StatefulWidget {
  String questionId;
  VoteScreen(String questionId){
    this.questionId = questionId;
  }
  @override
  _VoteScreenState createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {


  Map response;
  bool hasLoaded = false;
  String questionId;
  String title = ' ';
  String description = ' ';
  int cardCount = 7;
  int totalVotes = 0;
  int userVoteOption;
  List percentageList = [];
  @override
  void initState() {
    print(widget.questionId);
    // TODO: implement initState
    super.initState();
    questionId = widget.questionId;
    getQuestionData();
  }

  void getQuestionData() async{
    response = await getQuestionById(questionId);
    setState(() {
      totalVotes = response['totalVotes'];
      title = response['title'];
      description = response['description'];
      cardCount = response['options'].length;
      userVoteOption = response['userVoteOption'];
      hasLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(hasLoaded == false){
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Column(
                children: <Widget>[
                  Shimmer.fromColors(
                    baseColor: Colors.grey[200],
                    highlightColor: Colors.grey[300],
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.grey,
                              ),
                              height: 23,
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          height: 2,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Colors.grey,
                                    ),
                                    height: 15,
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Colors.grey,
                                    ),
                                    height: 15,
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Colors.grey,
                                    ),
                                    height: 15,
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[200],
                    highlightColor: Colors.grey[300],
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.grey,
                            ),
                            height: 23,
                            width: 140,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index){
                        return Padding(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: gradientColor,
                              ),
                              padding: EdgeInsets.all(20),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[200],
                                highlightColor: Colors.grey[300],
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.grey,
                                          ),
                                          height: 15,
                                          width: 180,

                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 9,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              color: Colors.grey,
                                            ),
                                            height: 15,

                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              color: Colors.grey,
                                            ),
                                            height: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            response = await getQuestionById(questionId);
            setState(() {
              totalVotes = response['totalVotes'];
              title = response['title'];
              description = response['description'];
              cardCount = response['options'].length;
              userVoteOption = response['userVoteOption'];
              hasLoaded = true;
            });
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              title,
                              style: TextStyle(
                                color: darkblueColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                fontFamily: 'Lato',
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              description,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 17,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                'Options',
                                style: TextStyle(
                                  color: pinkColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                  fontFamily: 'Lato',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            response = await getQuestionById(questionId);
                            setState(() {
                              totalVotes = response['totalVotes'];
                              title = response['title'];
                              description = response['description'];
                              cardCount = response['options'].length;
                              userVoteOption = response['userVoteOption'];
                              hasLoaded = true;
                            });
                          },
                          child: ListView.builder(
                            itemCount: cardCount,
                            itemBuilder: (context, index){
                              if(hasLoaded == false){
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: gradientColor,
                                    ),
                                    padding: EdgeInsets.all(20),
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey[200],
                                      highlightColor: Colors.grey[300],
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                  color: Colors.grey,
                                                ),
                                                height: 15,
                                                width: 180,

                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 9,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                    color: Colors.grey,
                                                  ),
                                                  height: 15,

                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                    color: Colors.grey,
                                                  ),
                                                  height: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                              String name = response['options'][index]['name'];
                              int votes = response['options'][index]['votes'];
                              int percentage;
                              double indicatorPercentage;
                              Color borderColor = Colors.transparent;
                              if(totalVotes == 0){
                                percentage = 0;
                                indicatorPercentage = 0;
                              }else{
                                percentage = ((votes / totalVotes) * 100).round();;
                                indicatorPercentage = votes / totalVotes;
                              }
                              if(index == userVoteOption){
                                  borderColor = opaquelightLightBlueColor;
                              }
                              return Padding(
                                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: gradientColor,
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
//                splashColor: opaquelightLightBlueColor,
                                          borderRadius: BorderRadius.circular(10),
                                          onTap: () async {

                                            //POST TO BACKEND ON /VOTEUNVOTE
                                            int statusCode = await voteUnvote(questionId, index);
                                            response = await getQuestionById(questionId);
                                            setState((){
                                              totalVotes = response['totalVotes'];
                                              title = response['title'];
                                              description = response['description'];
                                              cardCount = response['options'].length;
                                              userVoteOption = response['userVoteOption'];
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              border: Border.all(
                                                color: borderColor,
                                                width: 8,
                                              ),
                                            ),
                                            padding: EdgeInsets.all(12),
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Flexible(
                                                      child: Text(
                                                        name,
                                                        style: TextStyle(
                                                          color: darkblueColor,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 17,
                                                          fontFamily: 'Lato',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: LinearPercentIndicator(
                                                        animation: true,
                                                        animationDuration: 300,
                                                        lineHeight: 14,
                                                        percent: indicatorPercentage,
                                                        backgroundColor: Colors.grey,
                                                        progressColor: lightLightBlueColor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                      child: Text(
                                                        percentage.toString() + '%',
                                                        style: TextStyle(
                                                          fontFamily: 'Lato',
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
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
      ),
    );
  }
}
