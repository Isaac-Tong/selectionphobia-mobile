import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:selectionphobiamobile/constants.dart';
import '../networking/homepage.dart';

class MyPostPageView extends StatefulWidget {
  @override
  _MyPostPageViewState createState() => _MyPostPageViewState();
}

class _MyPostPageViewState extends State<MyPostPageView> {
  Map questionList;

  @override
  void initState() {
    super.initState();

    //Call this async function to display text for the carousel.
    getRecentQuestions();
  }

  void getRecentQuestions() async{
    questionList = await recentQuestionsGet();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider.builder(
        options: CarouselOptions(
          enlargeCenterPage: true,
          viewportFraction: 0.4,
          height: double.infinity,
          initialPage: 0,
          disableCenter: true,
        ),
        itemCount: 15,
        itemBuilder: (BuildContext context, int itemIndex){
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
        },
      ),
    );
  }
}
