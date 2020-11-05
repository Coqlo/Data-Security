import 'dart:convert';

class LoginResponse {
  String response;
  String firstname;
  String lastname;
  String email;
  String tel;
  int utypeid;



  LoginResponse({
    this.response,
    this.firstname,
    this.lastname,
    this.email,
    this.tel,
    this.utypeid,

  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    print('fromJson json: ' + json.toString());
    return LoginResponse(
      response: json['response'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      tel: json['tel'],
      utypeid: json['utypeid'],

    );
  }
}
