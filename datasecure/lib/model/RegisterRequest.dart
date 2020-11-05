class RegisterRequest {

  String firstName;
  String lastName;
  String email;
  String passWord;
  String address;


  RegisterRequest(
      {
        this.firstName,
        this.lastName,
        this.email,
        this.passWord,
        this.address,
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['passWord'] = this.passWord;
    data['address'] = this.address;



    return data;
  }

}
