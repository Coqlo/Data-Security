import 'package:datasecure/controller/API.dart';
import 'package:datasecure/global/global.dart';
import 'package:datasecure/model/VerifyRequest.dart';
import 'package:datasecure/model/VerifyResponse.dart';
import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:datasecure/global/global.dart' as globals;

import 'Newpassword.dart';


class Forgotpasswordemail extends StatefulWidget {
  @override
  _ForgotpasswordemailState createState() => _ForgotpasswordemailState();
}

class _ForgotpasswordemailState extends State<Forgotpasswordemail> {
  final _formKey = GlobalKey<FormState>();
  final api = API();
  TextEditingController controllerOTP = TextEditingController();

  forgotPasscode() async{
    if (_formKey.currentState.validate()) {
      String otp = controllerOTP.text;
      VerifyResponse res =
      await api.verify(VerifyRequest(email: globals.resetpassEmail, otp: otp));
      if (globals.status == "200") {
        if (res.response == "OTP CORRECT") {
          globals.OTP=otp;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Forgotnewpassword()));
        } else {
          SweetAlert.show(
            context,
            title: "Error",
            subtitle: "OTP INCORRECT",
            style: SweetAlertStyle.error,
          );
        }
      } else {
        SweetAlert.show(
          context,
          title: "Error",
          subtitle: "OTP INCORRECT",
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assests/images/bg.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
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
                            color: Color(0xFF5c3dd9),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                            height: _height / 4,
                            width: _height / 4,
                            child: Image.asset('assests/images/security.png'),
                          ),
                        ),
                        SizedBox(height: _height*0.05,),
                        Padding(
                          padding: EdgeInsets.only(
                              right: _width / 40.0, left: _width / 40.0),
                          child: Text(
                            'Verify Your Email Address',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: _width / 13.8,
                                ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: _height / 40.0)),
                        Text("Confirm it  belongs to you to keep your account secure",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: _height*0.019,
                                )),
                        Padding(padding: EdgeInsets.only(top: _height / 40.0)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.email, color: Color(0xFF7f4abf)),
                            Text(
                              " Email: "+globals.resetpassEmail,
                              style: TextStyle(
                                  color: Color(0xFF7f4abf), fontSize: _height*0.025),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: _height / 40.0)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: _width / 15, right: _width / 15),
                          child: TextFormField(
                            validator: (String value) {
                              if (value.length < 6)
                                return '*verification at least 6 number. Please try again';
                              if (value.isEmpty) return '*Please enter your verification code';
                            },
                            style: TextStyle(fontSize: _height*0.02,color: Color(0xFF7ebafe)),
                            controller: controllerOTP,
                            obscureText: false,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: _height*0.019),
                              labelText: 'Enter your verification code',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(
                                Icons.verified_user,
                                color: Color(0xFF7ebafe),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFF2f3146),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: _height / 20.0)),
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
                              "Submit",
                              style: TextStyle(
                                  fontSize: _height*0.035,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          onTap: () => {forgotPasscode()},
                        ),                         ]),
                    )),
              ),
              // ),
            )
          ],
        ));
  }
}
