class AddPostRequest {
  String email;
  String firstName;
  String lastName;
  String message;



  AddPostRequest(
      {

        this.email,
        this.firstName,
        this.lastName,
        this.message,

      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['message'] = this.message;

    return data;
  }

}
