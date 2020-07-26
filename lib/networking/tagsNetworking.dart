import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

dynamic fetchTags(String queryField, String fetchCount) async {

  //Get the token from shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Get the token
  var token = await prefs.getString('token');

  //Set cookie header
  Map<String, String> headerMap = {
    "cookie": token,
    "fetchcount": fetchCount,
    "tagname": queryField,
    "platform": "mobile",
    'Content-Type': 'application/json; charset=UTF-8',
  };

//  Post the data to backend
  http.Response res = await http.post(
      'https://selectionphobia.azurewebsites.net/tags',
      headers: headerMap,
  );

  //Reached the end of the query stream
  if(res.statusCode == 204){
    return false;
  }

  //Decode data to a map
  Map responseMap = json.decode(res.body);
  return responseMap;
}

