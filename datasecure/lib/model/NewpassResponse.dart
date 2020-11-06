import 'dart:convert';

class NewpassResponse {
  String response;



  NewpassResponse({
    this.response,

  });

  factory NewpassResponse.fromJson(Map<String, dynamic> json) {
    print('fromJson json: ' + json.toString());
    return NewpassResponse(
      response: json['response'],
    );
  }
}
