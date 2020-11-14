class PostRequest {
  String keyword;


  PostRequest(
      {

        this.keyword,

      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keyword'] = this.keyword;

    return data;
  }

}
