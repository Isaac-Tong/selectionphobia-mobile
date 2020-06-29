

import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'package:selectionphobiamobile/networking/askQuestion.dart';
import 'package:selectionphobiamobile/screens/option_menu.dart';

class AskQuestion extends StatefulWidget {
  @override
  _AskQuestionState createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {

  //Create children
  List optionMenu = [];
  List<Widget> _createChildren() {
    return new List<Widget>.generate(optionMenu.length, (int index) {
      return optionMenu[index];
    });
  }

  String question = '';
  String description = '';
  String currentOption;
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
      body: SingleChildScrollView(
        child: SafeArea(
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Options',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: gradientColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              onChanged: (value) {
                                currentOption = value;
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
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(

                          decoration: BoxDecoration(
                            color: pinkColor,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                          ),

                          child: Center(
                            child: FlatButton(
                              onPressed: () {
                                //Add a new list
                                setState(() {
                                  optionMenu.add(
                                    OptionMenu(currentOption)
                                  );
                                });
                              },
                              child: Text(
                                'Add',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: _createChildren(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
