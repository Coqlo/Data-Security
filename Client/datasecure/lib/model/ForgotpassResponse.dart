import 'dart:convert';

class ForgotpassResponse {
  String resposne;
  String responseEmail;


  ForgotpassResponse({
    this.resposne,
    this.responseEmail,
  });

  factory ForgotpassResponse.fromJson(Map<String, dynamic> json) {
    print('fromJson json: ' + json.toString());
    return ForgotpassResponse(
      resposne: json['resposne'],
      responseEmail: json['responseEmail'],
    );
  }
}
