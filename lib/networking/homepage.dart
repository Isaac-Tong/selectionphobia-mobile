import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map> recentQuestionsGet() async {

  //Set cookie header
  Map<String, String> headerMap = {
    "cookie": "token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVlZjczYjQ5YjdmMmJjNDk1Y2U2YmNiYSIsInVzZXIiOiJJc2FhYyIsImlhdCI6MTU5MzI2MDg3NSwiZXhwIjoxNTkzODY1Njc1fQ.0r2FQOFUxIsAYylyIjs9c9-ir5SYBDXF5OLU23N1ffE"
  };

  //Store http response to res
  http.Response res = await http.get('http://10.0.2.2:5000/myQuestions/mobilehomepage', headers: headerMap);

  Map questionMap = json.decode(res.body);
  return questionMap;
}

