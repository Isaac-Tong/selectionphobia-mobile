import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

//GET DATA FOR THE VOTE PAGE
Future<Map> getQuestionById(String questionID) async {

  //Retrieve user token
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = await prefs.getString('token');

  //Set cookie header
  Map<String, String> headerMap = {
    "cookie": token,
    "platform": "mobile",
    'Content-Type': 'application/json; charset=UTF-8',
  };

  // Post the data to backend
  http.Response res = await http.post(
      'http://10.0.2.2:5000/question/mobile',
      headers: headerMap,
      body: jsonEncode({
        'questionID': questionID,
      })
  );

  Map responseMap = json.decode(res.body);
  return responseMap;
}
//VOTEUNVOTE POST METHOD
Future<int> voteUnvote(String questionId, int optionId) async{
  //Retrieve user token
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = await prefs.getString('token');

  //Set cookie header
  Map<String, String> headerMap = {
    "cookie": token,
    "platform": "mobile",
    'Content-Type': 'application/json; charset=UTF-8',
  };

  // Post the data to backend
  http.Response res = await http.post(
      'http://10.0.2.2:5000/question/voteUnvote',
      headers: headerMap,
      body: jsonEncode({
        'questionId': questionId,
        'optionId': optionId,
      })
  );

  return res.statusCode;
}



//POST METHOD TO VOTE
Future<int> vote(String questionId, int optionId) async{
  //Retrieve user token
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = await prefs.getString('token');

  //Set cookie header
  Map<String, String> headerMap = {
    "cookie": token,
    "platform": "mobile",
    'Content-Type': 'application/json; charset=UTF-8',
  };

  // Post the data to backend
  http.Response res = await http.post(
      'http://10.0.2.2:5000/question/mobile/vote',
      headers: headerMap,
      body: jsonEncode({
        'questionId': questionId,
        'optionId': optionId,
      })
  );

  print(res.body);
}

//POST METHOD TO UNVOTE
Future<int> unvote(String questionId, int optionId) async{
  //Retrieve user token
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = await prefs.getString('token');

  //Set cookie header
  Map<String, String> headerMap = {
    "cookie": token,
    "platform": "mobile",
    'Content-Type': 'application/json; charset=UTF-8',
  };

  // Post the data to backend
  http.Response res = await http.post(
      'http://10.0.2.2:5000/question/mobile/unvote',
      headers: headerMap,
      body: jsonEncode({
        'questionId': questionId,
        'optionId': optionId,
      })
  );

  print(res.body);
  return res.statusCode;
}