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
  List percentageList = [];
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map questionResponse = await getQuestionById('5efa38c7194f32630007a074');
          setState(() {
            totalVotes = questionResponse['totalVotes'];
            response = questionResponse;
            title = questionResponse['title'];
            description = questionResponse['description'];
            cardCount = questionResponse['options'].length;
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
                    Text(
                      description,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                        fontFamily: 'Lato',
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

  OptionCard(String name, int votes, int totalVotes){
    this.name = name;

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
              borderRadius: BorderRadius.all(Radius.circular(10)),
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
                  padding: EdgeInsets.all(20),
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
