import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:selectionphobiamobile/constants.dart';
import '../networking/homepage.dart';
import 'package:shimmer/shimmer.dart';

//class MyPostPageView extends StatefulWidget {
//  @override
//  _MyPostPageViewState createState() => _MyPostPageViewState();
//}
//
//class _MyPostPageViewState extends State<MyPostPageView> {
//
//  //VARIABLES
//  Map questionMap;
//  var initialVar;
//  //CALL WHEN INIT STATE
//  @override
//  void initState() {
//    super.initState();
//    //Set it to null to set shimmering effect
//    initialVar = null;
//    //Call this async function to display text for the carousel.
//    getRecentQuestions();
//
//  }
//
//  void getRecentQuestions() async{
//    questionMap = await recentQuestionsGet();
//    print(questionMap['questions'][0]['totalVotes']);
//    setState(() {
//      initialVar = questionMap;
//    });
//  }
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: CarouselSlider.builder(
//        options: CarouselOptions(
//          viewportFraction: 0.5,
//          height: double.infinity,
//          initialPage: 15,
//          disableCenter: false,
//          enableInfiniteScroll: true,
//          enlargeCenterPage: true,
//        ),
//        itemCount: 2,
//        itemBuilder: (BuildContext context, int itemIndex) {
//          return Container(
//            margin: EdgeInsets.all(5),
//            width: double.infinity,
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.all(Radius.circular(8)),
//              color: lightblueColor,
//            ),
//            child: Padding(
//              padding: EdgeInsets.all(12),
//              child: ShimmerPage(initialVar, itemIndex),
//            ),
//          );
//        },
//      ),
//    );
//  }
//}


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
  //CALL WHEN INIT STATE
  @override
  void initState() {
    super.initState();
    //Set it to null to set shimmering effect
    initialVar = null;
    //Call this async function to display text for the carousel.
//    getRecentQuestions();

  }

//  void getRecentQuestions() async{
//    questionMap = await recentQuestionsGet();
//    print(questionMap['questions'][0]['totalVotes']);
//    setState(() {
//      initialVar = questionMap;
//    });
//  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (BuildContext context, int itemIndex) {
          return Container(
            margin: EdgeInsets.all(5),
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: lightblueColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ShimmerPage(widget.initialVar, itemIndex),
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
      children: <Widget>[
        Text(
          questionText,
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: darkblueColor,
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

class MyPostContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: lightblueColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Should I ask my son about how he\'s feeling?',
              style: TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: darkblueColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  '49 Views',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Lato',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
