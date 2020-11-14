class CommentRequest {
  String pid;


  CommentRequest(
      {

        this.pid,

      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;

    return data;
  }

}
