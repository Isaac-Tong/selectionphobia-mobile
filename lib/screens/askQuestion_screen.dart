import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'package:selectionphobiamobile/networking/askQuestion.dart';

class AskQuestion extends StatefulWidget {
  @override
  _AskQuestionState createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {

  String question = 'af';
  String description = 'af';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        backgroundColor: darkblueColor,
        onPressed: (){
          askQuestion(question, description);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Ask a question',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      color: pinkColor,
                      fontSize: 30,

                    ),
                  ),
                  Container(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Question',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //QUESTION WIDGET
              Container(
                decoration: BoxDecoration(
                  color: gradientColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    onChanged: (value) {
                      question = value;
                    },
                    style: TextStyle(
                      fontFamily: 'Lato'
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    autofocus: false,
                    maxLines: 4,
                    minLines: 1,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Description',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //DESCRIPTION WIDGET
              Container(
                decoration: BoxDecoration(
                  color: gradientColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    onChanged: (value) {
                      description = value;
                    },
                    style: TextStyle(
                        fontFamily: 'Lato'
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    autofocus: false,
                    maxLines: 10,
                    minLines: 5,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
