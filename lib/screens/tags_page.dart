import 'package:flutter/material.dart';
import 'package:selectionphobiamobile/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:selectionphobiamobile/networking/tagsNetworking.dart';
import 'package:selectionphobiamobile/screens/vote_screen.dart';

class TagsPage extends StatefulWidget {
  String queryField;
  TagsPage(String queryField){
    this.queryField = queryField;
  }
  @override
  _TagsPageState createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
  ScrollController _scrollController = new ScrollController();

  int fetchCount = 0;
  bool streamEnd = false;

  //Arrays
  List totalVotes = [];
  List id = [];
  List title = [];
  List description = [];
  List tags = [];
  bool hasLoaded = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        setState(() {
          fetchCount = totalVotes.length;
          fetchTen();
        });
      }
    });
    fetchTen();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  void fetchTen() async{
    var tagResponse = await fetchTags(widget.queryField, fetchCount.toString());

    if(tagResponse == false){
      setState(() {
        streamEnd = true;
      });
      return;
    }
    setState(() {
      //Push to each field's list
      for(int i = 0; i < tagResponse['questions'].length; i++){
        totalVotes.add(tagResponse['questions'][i]['totalVotes']);
        id.add(tagResponse['questions'][i]['_id']);
        title.add(tagResponse['questions'][i]['title']);
        description.add(tagResponse['questions'][i]['description']);
        tags.add(tagResponse['questions'][i]['tags']);

      }
      //Set hasLoaded as true
      hasLoaded = true;
    });

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    widget.queryField,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      color: darkblueColor,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
            Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: totalVotes.length + 1,
                  itemBuilder: (context, index){


                    if(hasLoaded == false) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        decoration: BoxDecoration(
                          color: gradientColor,
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(18),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[200],
                            highlightColor: Colors.grey[300],
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 15,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        color: gradientColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          height: 15,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: gradientColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: 15,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            color: gradientColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 15,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            color: gradientColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Container(
                                          height: 25,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: gradientColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 25,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: gradientColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }

                    if(index == totalVotes.length){
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
                          ),
                        ),
                      );
                    }



                    String _title = title[index];
                    String _id = id[index];
                    String _totalVotes = totalVotes[index].toString();
                    String _description = description[index];
                    String _tags = tags[index];

                    List<Widget> contentColumn = [
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              _title,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              _description,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.normal,
                                color: darkGreyColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.poll,
                                    color: lightLightBlueColor,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    _totalVotes,
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 15,
                                      color: lightLightBlueColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ];

                    //Logic for hot icon
                    if (int.parse(_totalVotes) >=
                        4) {
                      contentColumn = [
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                _title,
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                  color: darkblueColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.whatshot,
                                  color: Colors.deepOrangeAccent,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  'hot',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.deepOrangeAccent,
                                  ),
                                ),
                              ],
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                _description,
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.normal,
                                  color: darkGreyColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: darkGreyColor,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Text(
                                    _tags,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.poll,
                                      color: lightLightBlueColor,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      _totalVotes,
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 15,
                                        color: lightLightBlueColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      ];
                    }

                    return Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      decoration: BoxDecoration(
                        color: gradientColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Container(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VoteScreen(_id)),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(18),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.stretch,
                                children: contentColumn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}
