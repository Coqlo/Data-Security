import 'dart:convert';

class VerifyResponse {
  String response;



  VerifyResponse({
    this.response,

  });

  factory VerifyResponse.fromJson(Map<String, dynamic> json) {
    print('fromJson json: ' + json.toString());
    return VerifyResponse(
      response: json['response'],
    );
  }
}
