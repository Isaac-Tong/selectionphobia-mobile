import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void createPost(String user, String pass, String email) async {
  //Sanitize the username and password
  user = user.replaceAll(' ', '');

  var res = await http.post(
    'http://10.0.2.2:5000/registration',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'platform': 'mobile',
    },
    body: jsonEncode(<String, String>{
      'username': user,
      'password': pass,
      'email': email,
    }),
  );

  //Check if there was an error when signing in
  var statusCode = res.statusCode;

  //Username already exists
  if(statusCode == 422){
    throw 'Username already exists';
  }
  //Email already exists
  if(statusCode == 409){
    throw 'Email already exists';
  }

  //Otherwise there is no error
  var token = res.body;

  print(token);

  //Remove token quotations
  token = token.replaceAll('"', '');

  //Create instance of shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

  //Save the token to storage
  await prefs.setString('token', 'token='+token);
}