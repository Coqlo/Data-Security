import 'dart:convert';

class RegisterResponse {
  String response;




  RegisterResponse({
    this.response,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    print('fromJson json: ' + json.toString());
    return RegisterResponse(
      response: json['response'],

    );
  }
}
