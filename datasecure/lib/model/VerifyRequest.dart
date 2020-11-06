class VerifyRequest {

  String email;
  String otp;

  VerifyRequest(
      {
        this.email,
        this.otp,
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['email'] = this.email;
    data['otp'] = this.otp;

    return data;
  }

}
