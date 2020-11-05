import 'dart:convert';

class LoginResponse {
  String response;
  String firstName;
  String lastName;
  String email;




  LoginResponse({
    this.response,
    this.firstName,
    this.lastName,
    this.email,


  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    print('fromJson json: ' + json.toString());
    return LoginResponse(
      response: json['response'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],

    );
  }
}
