class LoginRequest {

  String email;
  String passWord;

  LoginRequest(
      {
        this.email,
        this.passWord,
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['email'] = this.email;
    data['passWord;'] = this.passWord;

    return data;
  }

}
