import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future newQuestion() async {

  //Get the token from shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Get the token
  var token = await prefs.getString('token');

  //Set cookie header
  Map<String, String> headerMap = {
    "cookie": token,
    "platform": "mobile",
    'Content-Type': 'application/json; charset=UTF-8',
  };

  //Post the data to backend
  http.Response res = await http.get(
      'http://10.0.2.2:5000/new',
      headers: headerMap,
  );
  Map newMap = json.decode(res.body);
  return newMap;
}