import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void loginPost(String user, String pass) async {

  if(user == null || pass == null){
    throw 'Fields are empty';
  }

  //Sanitize the username and password
  user = user.replaceAll(' ', '');

  var res = await http.post(
    'https://selectionphobia.azurewebsites.net/login',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'platform': 'mobile',
    },
    body: jsonEncode(<String, String>{
      'username': user,
      'password': pass
    }),
  );

  //Check if there was an error when signing in
  var statusCode = res.statusCode;
  if(statusCode == 401){
    //Wrong password/username combo
    throw 'Wrong username or password';
  }

  //Otherwise there is no error
  var token = res.body;

  //Remove token quotations
  token = token.replaceAll('"', '');

  //Create instance of shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

  //Save the token to storage
  await prefs.setString('token', 'token='+token);
}