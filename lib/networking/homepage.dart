import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map> recentQuestionsGet() async {

  //Get the token from shared preferences

  SharedPreferences prefs = await SharedPreferences.getInstance();

  //Save the token to storage
  var token = await prefs.getString('token');

  //Set cookie header
  Map<String, String> headerMap = {
    "cookie": token,
  };

  print(token);

  //Store http response to res
  http.Response res = await http.get('http://10.0.2.2:5000/myQuestions/mobilehomepage', headers: headerMap);

  Map questionMap = json.decode(res.body);
  return questionMap;
}

