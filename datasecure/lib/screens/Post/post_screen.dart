import 'package:datasecure/model/PostRequest.dart';
import 'package:datasecure/model/PostResponse.dart';
import 'package:datasecure/screens/Post/Addpost_screen.dart';
import 'package:datasecure/screens/Post/comment_screen.dart';
import 'package:flutter/material.dart';

import '../../controller/API.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  final api = API();
  List<DropdownMenuItem<String>> listDrop = [];
  String selected = null;
  String keyword = "keyword";
  bool onSearch = false;

  Future<List<PostResponse>> search(String value) async {
    print("post (${value})");
    var data = new PostRequest(keyword: value);
    return await api.getPost(data);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFF040526),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Addpost()));
          },
          child: Icon(Icons.create),
          backgroundColor: Color(0xFFe4357e),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: FutureBuilder<List<PostResponse>>(
                    future: search(keyword),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        var posts = snapshot.data;
                        print("posts: ${posts.toString()}");
                        print("postsize: ${posts.length}");
                        return ListView.builder(
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            print('index: ${index}');
                            return _listItem(posts[index], context);
                          },
                        );
                      }
                    }),
              ),
            ],
          ),
        ));
  }
  _listItem(PostResponse post, context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Comment(
                    res: post,
                  ))),
      child: Card(
        child: Container(
          decoration: BoxDecoration(color: Color(0xFF191a49)),
          child: Padding(
            padding: EdgeInsets.only(
                top: _width / 30.0,
                bottom: _width / 30.0,
                right: _width / 35.0,
                left: _width / 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${post.firstname} ${post.lastname}",
                        style: TextStyle(
                          fontSize: _width / 20,
                          color: Color(0xFF7ebafe),
                        ),
                      ),
                      Text(
                        "<${post.email}>",
                        style: TextStyle(
                          fontSize: _width / 25,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "${post.time}",
                            style: TextStyle(
                              fontSize: _width / 25,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(width: _width*0.03,),
                          Text(
                            "${post.date}",
                            style: TextStyle(
                              fontSize: _width / 25,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: _width*0.04,),
                      Text(
                        "${post.message}",
                        style: TextStyle(
                          fontSize: _width / 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
