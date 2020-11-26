import 'package:datasecure/model/AddPostRequest.dart';
import 'package:datasecure/model/AddPostResponse.dart';
import 'package:datasecure/global/global.dart' as globals;
import 'package:datasecure/screens/Post/post_screen.dart';
import 'package:datasecure/screens/index_screen.dart';
import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';
import '../../controller/API.dart';

class Addpost extends StatefulWidget {
  @override
  _AddpostState createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  final _formKey = GlobalKey<FormState>();
  final api = API();
  TextEditingController controllerPost = TextEditingController();

  doPost() async {
    if (_formKey.currentState.validate()) {
      String post = controllerPost.text;
      AddPostResponse res = await api.addpost(AddPostRequest(
          email: globals.email,
          firstName: globals.firstname,
          lastName: globals.lastname,
          message: post));
      if (globals.status == "200") {
        if (res.response == "Post Success") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => IndexScreen()));
        } else {
          SweetAlert.show(
            context,
            title: "Error",
            subtitle: "Create Post Failed!",
            style: SweetAlertStyle.error,
          );
        }
      } else {
        SweetAlert.show(
          context,
          title: "Error",
          subtitle: "Create Post Failed!",
          style: SweetAlertStyle.error,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: _height,
              width: _width,
              color: Color(0xFF040526),
            ),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                    padding: EdgeInsets.only(
                        top: _height / 15.0,
                        right: _width / 20.0,
                        left: _width / 20.0),
                    child: Container(
                      // child: SingleChildScrollView(
                      child: Column(children: [
                        Container(
                          width: _width,
                          child: IconButton(
                            alignment: Alignment.centerLeft,
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Color(0xFFe4357e),
                          ),
                        ),
                        SizedBox(
                          height: _height * 0.05,
                        ),
                        Text(
                          'Create Post',
                          style: TextStyle(
                            color: Color(0xFF1fdcb2),
                            fontSize: _height * 0.05,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: _height / 40.0)),
                        TextFormField(
                          autofocus: true,
                          validator: (String value) {
                            if (value.isEmpty)
                              return '*Please writing anything';
                          },
                          style: TextStyle(
                              fontSize: _height * 0.025,
                              color: Color(0xFF7ebafe)),
                          controller: controllerPost,
                          obscureText: false,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(fontSize: _height * 0.019),
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            hintText: 'Writing anything.',
                            hintStyle: TextStyle(color: Colors.white70),
                            hintMaxLines: 4,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            filled: true,
                            fillColor: Color(0xFF2f3146),
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                        Padding(padding: EdgeInsets.only(top: _height * 0.05)),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Color(0xFF1fdcb2),
                            ),
                            alignment: Alignment.center,
                            height: _height * 0.07,
                            width: _width,
                            child: Text(
                              "Post",
                              style: TextStyle(
                                  fontSize: _height * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          onTap: () => {doPost()},
                        ),
                      ]),
                    )),
              ),
              // ),
            )
          ],
        ));
  }
}
