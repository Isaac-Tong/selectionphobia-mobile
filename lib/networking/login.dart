import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> loginPost(String user, String pass) {
  return http.post(
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
}