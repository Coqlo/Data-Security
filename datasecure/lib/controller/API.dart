
import 'dart:convert';
import 'package:datasecure/model/LoginRequest.dart';
import 'package:datasecure/model/LoginResponse.dart';
import 'package:http/http.dart' as http;
import 'package:datasecure/global/global.dart' as globals;

class API {
  Future<Map<String, dynamic>> loginconnect(Map data, String url) async {
    utf8.toString();
    String body = json.encode(data);
    print('body: ' + body);
    final response = await http.post('http://192.168.43.45:8080/' + url,
        headers: {"X-Signature": "USER","Content-Type": "application/json; charset=UTF-8"},
        body: body);
    String logResponse = response.statusCode.toString();
    print('ResponseStatusCode: $logResponse');
    if (response.statusCode == 200) {
      globals.status = "200";
      print('ResponseStatusCode: $logResponse'); // Check Status Code = 200
      print('ResponseBody: ' + response.body); // Read Data in Array
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      globals.status = "500";
      throw Exception('error :(');
    }
  }

  Future<LoginResponse> login(LoginRequest data) async {
    String url = 'user/login';

    Map<String, dynamic> loginres = await loginconnect(data.toJson(), url);
    return LoginResponse.fromJson(loginres);
  }
}