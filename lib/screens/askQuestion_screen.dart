
import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'package:selectionphobiamobile/networking/askQuestion.dart';
import 'package:selectionphobiamobile/screens/option_menu.dart';

class AskQuestion extends StatefulWidget {
  @override
  _AskQuestionState createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {

  //TEST PAGE
  List cards = [];

  List item = [DropdownMenuItem(value: 'abc',child: Text('Hello'))];


  //Call this function to create a new option menu
  Widget createOptionMenu(String optionText, int counter){
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 70,
          minWidth: double.infinity,
          maxHeight: 150,
          maxWidth: double.infinity,
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(3, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text(
                    optionText,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: 3,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          optionMenu.removeAt(counter);
                        });
                      },
                      child: Text(
                        'Remove',

                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Create children
  List optionMenu = [];
  List<Widget> _createChildren() {
    return new List<Widget>.generate(optionMenu.length, (int index) {
      return optionMenu[index];
    });
  }
  //Remove children
  void removeChildren(String text){

  }


  int optionMenuCounter = 0;

  String question = '';
  String description = '';
  String currentOption;

  //The array of options
  List allOptions = [];

  TextEditingController optionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(builder: (context){
        return FloatingActionButton(
          child: Icon(Icons.send),
          backgroundColor: darkblueColor,
          onPressed: (){
            if(question.length > 110){
              SnackBar noItems = SnackBar(
                content: Text(
                  'Please limit your question to 110 characters',
                  style: TextStyle(
                    fontFamily: 'Lato',
                  ),
                ),
                backgroundColor: pinkColor,
              );
              Scaffold.of(context).showSnackBar(noItems);
              return;
            }

            if(cards.length == 0){
              SnackBar noItems = SnackBar(
                content: Text(
                    'Please add at least one option',
                  style: TextStyle(
                    fontFamily: 'Lato',
                  ),
                ),
                backgroundColor: pinkColor,
              );
              Scaffold.of(context).showSnackBar(noItems);
              return;
            }
            if(question == ''){
              SnackBar noItems = SnackBar(
                content: Text(
                  'Your question cannot be empty',
                  style: TextStyle(
                    fontFamily: 'Lato',
                  ),
                ),
                backgroundColor: pinkColor,
              );
              Scaffold.of(context).showSnackBar(noItems);
              return;
            }
            if(description == ''){
              SnackBar noItems = SnackBar(
                content: Text(
                  'Your description cannot be empty',
                  style: TextStyle(
                    fontFamily: 'Lato',
                  ),
                ),
                backgroundColor: pinkColor,
              );
              Scaffold.of(context).showSnackBar(noItems);
              return;
            }

          askQuestion(question, description, cards);
          Navigator.pop(context);
          },
        );
      }
      ),
      body: Builder( builder: (context){
        return SingleChildScrollView(
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
                        'Tags',
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
                  DropdownButton<String>(
                    items: <String>['A', 'B', 'C', 'D'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
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
                                controller: optionController,
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
                                    if(currentOption == null || currentOption == ''){
                                      return;
                                    }
                                    if(cards.length == 4){
                                      SnackBar noItems = SnackBar(
                                        content: Text(
                                          'You cannot add more than 4 options',
                                          style: TextStyle(
                                            fontFamily: 'Lato',
                                          ),
                                        ),
                                        backgroundColor: pinkColor,
                                      );
                                      Scaffold.of(context).showSnackBar(noItems);
                                      return;
                                    }
                                    optionController.clear();
                                    cards.add(currentOption);
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
                  Container(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cards.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: 70,
                              minWidth: double.infinity,
                              maxHeight: 150,
                              maxWidth: double.infinity,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                    offset: Offset(3, 3), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                      child: Text(
                                        cards[index],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.symmetric(vertical: 10),
                                          width: 3,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.redAccent,
                                            borderRadius: BorderRadius.all(Radius.circular(4)),
                                          ),
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              cards.removeAt(index);
                                            });
                                          },
                                          child: Text(
                                            'Remove',

                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w900,
                                              fontSize: 15,
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      ),
    );
  }
}
