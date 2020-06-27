import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:selectionphobiamobile/constants.dart';

class MyPostPageView extends StatefulWidget {
  @override
  _MyPostPageViewState createState() => _MyPostPageViewState();
}

class _MyPostPageViewState extends State<MyPostPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider.builder(
        options: CarouselOptions(
          viewportFraction: 0.1,
          height: double.infinity,
        ),
        itemCount: 15,
        itemBuilder: (BuildContext context, int itemIndex){
          return Container(
            width: double.infinity,
            color: lightblueColor,
            child: Text('abcd'),
          );
        },
      ),
    );
  }
}
