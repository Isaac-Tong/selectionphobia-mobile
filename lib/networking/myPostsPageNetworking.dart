import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map> getMyPosts() async {

  //Get the token from shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

  //Get the token
  var token = await prefs.getString('token');

  //Set cookie header
  Map<String, String> headerMap = {
    "cookie": token,
    "platform": "mobile"
  };

  //Store http response to res
  http.Response res = await http.get('http://10.0.2.2:5000/myQuestions/compact', headers: headerMap);

  Map questionMap = json.decode(res.body);
  return questionMap;
}