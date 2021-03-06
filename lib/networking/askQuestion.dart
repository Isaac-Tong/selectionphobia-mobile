import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void askQuestion(String question, String description, List cards, String tag) async {

  print(cards);
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

//  Post the data to backend
  http.Response res = await http.post(
    'https://selectionphobia.azurewebsites.net/ask',
    headers: headerMap,
      body: jsonEncode({
        'title': question,
        'description': description,
        'options': cards,
        'tags': tag,
      })
  );

  print(res.statusCode);

}