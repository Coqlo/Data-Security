class PostResponse {

  int id;
  String firstname;
  String lastname;
  String email;
  String message;
  String date;
  String time;




  PostResponse(
      {
        this.id,
        this.firstname,
        this.lastname,
        this.email,
        this.message,
        this.date,
        this.time,
      });

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    print('fromJson json: '+  json.toString());
    return PostResponse(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      message: json['message'],
      date: json['date'],
      time: json['time'],


    );
  }

  @override
  String toString() {
    return 'post{id: $id, firstname: $firstname, lastname: $lastname, email: $email, message: $message, date: $date, time: $time}';
  }
}
