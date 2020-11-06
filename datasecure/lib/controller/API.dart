
import 'dart:convert';
import 'package:datasecure/model/ForgotpassRequest.dart';
import 'package:datasecure/model/ForgotpassResponse.dart';
import 'package:datasecure/model/LoginRequest.dart';
import 'package:datasecure/model/LoginResponse.dart';
import 'package:datasecure/model/NewpassRequest.dart';
import 'package:datasecure/model/NewpassResponse.dart';
import 'package:datasecure/model/RegisterRequest.dart';
import 'package:datasecure/model/RegisterResponse.dart';
import 'package:datasecure/model/VerifyRequest.dart';
import 'package:datasecure/model/VerifyResponse.dart';
import 'package:http/http.dart' as http;
import 'package:datasecure/global/global.dart' as globals;

class API {
  Future<Map<String, dynamic>> connect(Map data, String url) async {
    utf8.toString();
    String body = json.encode(data);
    print('body: ' + body);
    final response = await http.post('http://10.34.5.169:8080/' + url,
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
    String url = 'home/signIn';

    Map<String, dynamic> loginres = await connect(data.toJson(), url);
    return LoginResponse.fromJson(loginres);
  }

  Future<RegisterResponse> register(RegisterRequest data) async {
    String url = 'home/registration';

    Map<String, dynamic> regisres = await connect(data.toJson(), url);
    return RegisterResponse.fromJson(regisres);
  }
  Future<ForgotpassResponse> forgotpass(ForgotpassRequest data) async {
    String url = 'home/forgotPassword';

    Map<String, dynamic> forgotpassres = await connect(data.toJson(), url);
    return ForgotpassResponse.fromJson(forgotpassres);
  }
  Future<VerifyResponse> verify(VerifyRequest data) async {
    String url = 'home/checkOTP';

    Map<String, dynamic> verifyres = await connect(data.toJson(), url);
    return VerifyResponse.fromJson(verifyres);
  }
  Future<NewpassResponse> newpass(NewpassRequest data) async {
    String url = 'home/changPassword';

    Map<String, dynamic> newpassres = await connect(data.toJson(), url);
    return NewpassResponse.fromJson(newpassres);
  }
}