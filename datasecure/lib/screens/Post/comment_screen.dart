import 'dart:io';
import 'package:datasecure/global/global.dart' as globals;
import 'package:datasecure/model/AddCommentRequest.dart';
import 'package:datasecure/model/AddCommentResponse.dart';
import 'package:datasecure/model/CommentRequest.dart';
import 'package:datasecure/model/CommentResponse.dart';
import 'package:datasecure/model/PostRequest.dart';
import 'package:datasecure/model/PostResponse.dart';
import 'package:datasecure/screens/index_screen.dart';
import 'file:///D:/Work/DataSe/Data-Security/datasecure/lib/screens/Post/post_screen.dart';
import 'package:flutter/material.dart';

import '../../controller/API.dart';

PostResponse res1;

class Comment extends StatefulWidget {
  PostResponse res;

  Comment({Key key, @required this.res}) : super(key: key);

  @override
  _CommentState createState() {
    res1 = this.res;
    return _CommentState();
  }
}

class _CommentState extends State<Comment> {
  final api = API();
  List<DropdownMenuItem<String>> listDrop = [];
  String selected = null;
  String keyword = res1.id.toString();
  bool onSearch = false;

  Future<List<CommentResponse>> search(String value) async {
    print("search (${value})");
    var data = new CommentRequest(pid: value);
    return await api.getComment(data);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(

        backgroundColor: Color(0xFF040526),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: _width,
                child: IconButton(
                  alignment: Alignment.centerLeft,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Color(0xFF1fdcb2),
                ),
              ),
              _Post(context),
              Row(
                children: [
                  SizedBox(width: _width*0.05,),
                  Text(
                    "Comment",textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: _width / 15,
                      color: Color(0xFF1fdcb2),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: FutureBuilder<List<CommentResponse>>(
                    future: search(keyword),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        var comments = snapshot.data;
                        print("comments: ${comments.toString()}");
                        print("commentsize: ${comments.length}");
                        return ListView.builder(
                          itemCount: comments.length,
                          itemBuilder: (context, index) {
                            print('index: ${index}');
                            return _listComment(comments[index], context);
                          },
                        );
                      }
                    }),
              ),
              _comment(context),
            ],
          ),
        ));
  }

  _Post(context) {
    double _width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => {},
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
                        "${res1.firstname} ${res1.lastname}",
                        style: TextStyle(
                          fontSize: _width / 20,
                          color: Color(0xFF7ebafe),
                        ),
                      ),
                      Text(
                        "<${res1.email}>",
                        style: TextStyle(
                          fontSize: _width / 25,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "${res1.time}",
                            style: TextStyle(
                              fontSize: _width / 25,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(width: _width*0.03,),
                          Text(
                            "${res1.date}",
                            style: TextStyle(
                              fontSize: _width / 25,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: _width*0.04,),
                      Text(
                        "${res1.message}",
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

  _listComment(CommentResponse comment, context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return GestureDetector(
      //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Comment(res: comment,))),
      child: Padding(
        padding: EdgeInsets.only(
            right: _width / 20.0, left: _width / 20.0, top: _width / 40.0),
        child: Card(
          child: Container(
            decoration: BoxDecoration(color: Color(0xFF2D2F6B)),
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
                          "${comment.firstname} ${comment.lastname}",
                          style: TextStyle(
                            fontSize: _width / 20,
                            color: Color(0xFFe4357e),
                          ),
                        ),
                        Text(
                          "<${comment.email}>",
                          style: TextStyle(
                            fontSize: _width / 25,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "${comment.time}",
                              style: TextStyle(
                                fontSize: _width / 25,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            SizedBox(width: _width*0.03,),

                            Text(
                              "${comment.date}",
                              style: TextStyle(
                                fontSize: _width / 25,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _width * 0.04,
                        ),
                        Text(
                          "${comment.message}",
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
      ),
    );
  }

  _comment(context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
          right: _width / 20.0, left: _width / 20.0, top: _width / 20.0),
      child: TextField(
        style: TextStyle(
          color: Colors.white,
        ),
        onSubmitted: (text) {
          setState(() async {
            keyword = text;
            onSearch = true;
            AddCommentResponse res = await api.addcomment(AddCommentRequest(pid: res1.id,email: globals.email,firstName: globals.firstname,lastName: globals.lastname,message: text));
            text = null;
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => IndexScreen()));
          });
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFFC300)),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFFC300)),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          hintText: 'Comment...',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
