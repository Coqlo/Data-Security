
class AddCommentResponse {
  String response;




  AddCommentResponse({
    this.response,
  });

  factory AddCommentResponse.fromJson(Map<String, dynamic> json) {
    print('fromJson json: ' + json.toString());
    return AddCommentResponse(
      response: json['response'],

    );
  }
}
