class NewpassRequest {

  String email;
  String otp;
  String passWord;

  NewpassRequest(
      {
        this.email,
        this.otp,
        this.passWord,
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['email'] = this.email;
    data['otp'] = this.otp;
    data['passWord'] = this.passWord;

    return data;
  }

}
