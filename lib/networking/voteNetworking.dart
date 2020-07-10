import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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
