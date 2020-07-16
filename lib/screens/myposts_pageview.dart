import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:selectionphobiamobile/constants.dart';
import '../networking/homepage.dart';
import 'package:shimmer/shimmer.dart';
import 'package:selectionphobiamobile/screens/vote_screen.dart';


class MyPostPageView extends StatefulWidget {
  final initialVar;
  MyPostPageView(this.initialVar);

  @override
  _MyPostPageViewState createState() => _MyPostPageViewState();
}

class _MyPostPageViewState extends State<MyPostPageView> {

  //VARIABLES
  Map questionMap;
  var initialVar;
  int initCount = 3;
  //CALL WHEN INIT STATE
  @override
  void initState() {
    super.initState();
    //Set it to null to initiate shimmering effect
    initialVar = null;
  }



  @override
  Widget build(BuildContext context) {

    if(widget.initialVar != null){
      initCount = widget.initialVar['questions'].length;

    }

    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: initCount,
        itemBuilder: (BuildContext context, int itemIndex) {
          return Container(
            margin: EdgeInsets.all(5),
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: lightblueColor,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                onTap: (){
                  if(widget.initialVar == null){
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            VoteScreen(widget.initialVar['questions'][itemIndex]['_id'])),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: ShimmerPage(widget.initialVar, itemIndex),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ShimmerPage extends StatelessWidget {

  var qmap;
  var pageIndex;
  var questionText = 'Loading';
  var voteText = 'Loading';
  ShimmerPage(var map, [var index]){
    pageIndex = index;
    qmap = map;
  }


  @override
  Widget build(BuildContext context) {
    if(qmap == null){
      return Container(
        child: Shimmer.fromColors(
          baseColor: Colors.grey[200],
          highlightColor: Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.grey[200],
                    ),
                    width: double.infinity,
                    height: 15,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.grey[200],
                          ),
                          width: double.infinity,
                          height: 15,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.grey[200],
                      ),
                      height: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    questionText = qmap['questions'][pageIndex]['title'];
    voteText = qmap['questions'][pageIndex]['totalVotes'].toString();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            questionText,
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: darkblueColor,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'Votes: $voteText',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Lato',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
