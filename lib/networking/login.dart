import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void loginPost(String user, String pass) async {
  var res = await http.post(
    'http://10.0.2.2:5000/login',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'platform': 'mobile',
    },
    body: jsonEncode(<String, String>{
      'username': user,
      'password': pass
    }),
  );
  var token = res.body;
  print('hello');

  //Create instance of shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

  //Save the token to storage
  await prefs.setString('token', token);
}