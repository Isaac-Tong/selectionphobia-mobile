import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'dart:math';

class TrendingPosts extends StatefulWidget {
  @override
  _TrendingPostsState createState() => _TrendingPostsState();
}

class _TrendingPostsState extends State<TrendingPosts> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          int min = 0;
          int max = 4;
          Random rnd = new Random();
          int r = min + rnd.nextInt(max - min);

          //List of random colours
          var randomColor = [
            pastelorangeColor,
            pastelgreenColor,
            pastelblueColor,
            pastelpinkColor,
            greyColor
          ];

          return Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: randomColor[r],
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'ABCDEFG',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.normal,
                  fontSize: 20
                ),
              ),
            ),
          );
        });
  }
}
