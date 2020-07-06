import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';

class VoteScreen extends StatefulWidget {
  @override
  _VoteScreenState createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Lorem ipsum dolor sit amet, consecteur aliqua',
                        style: TextStyle(
                          color: darkblueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: 'Lato',
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                    fontFamily: 'Lato',
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
