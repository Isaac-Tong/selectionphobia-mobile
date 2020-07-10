import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:selectionphobiamobile/networking/voteNetworking.dart';

class VoteScreen extends StatefulWidget {
  @override
  _VoteScreenState createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  String title = ' ';
  String description = ' ';
  int cardCount;
  Map response;
  int totalVotes = 0;
  int userVoteOption;
  List percentageList = [];
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map questionResponse = await getQuestionById('5f07ccd8a530bde30c48c05f');
          setState(() {
            totalVotes = questionResponse['totalVotes'];
            response = questionResponse;
            title = questionResponse['title'];
            description = questionResponse['description'];
            cardCount = questionResponse['options'].length;
            userVoteOption = questionResponse['userVoteOption'];
          });
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
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
                  child: ListView.builder(
                    itemCount: cardCount,
                    itemBuilder: (context, index){
                      //Special case if user selected it
                      if(index == userVoteOption){
                        return OptionCard(response['options'][index]['name'], response['options'][index]['votes'], totalVotes, true);
                      }
                      return OptionCard(response['options'][index]['name'], response['options'][index]['votes'], totalVotes);
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
}

class OptionCard extends StatelessWidget {
  String name;
  int percentage;
  double indicatorPercentage;
  bool isUserVoted;
  Color borderColor = Colors.transparent;

  OptionCard(String name, int votes, int totalVotes, [bool isUserVoted]){
    this.name = name;

    if(isUserVoted == true){
      borderColor = opaquelightLightBlueColor;
    }

    if(totalVotes == 0){
      this.indicatorPercentage = 0;
      this.percentage = 0;
      return;
    }
    this.indicatorPercentage = votes / totalVotes;
    this.percentage = ((votes / totalVotes) * 100).round();
  }

  @override
  Widget build(BuildContext context) {
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
                onTap: () {
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
  }
}
