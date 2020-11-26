
class AddPostResponse {
  String response;




  AddPostResponse({
    this.response,
  });

  factory AddPostResponse.fromJson(Map<String, dynamic> json) {
    print('fromJson json: ' + json.toString());
    return AddPostResponse(
      response: json['response'],

    );
  }
}
