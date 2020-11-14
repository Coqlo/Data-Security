import 'package:datasecure/controller/API.dart';
import 'package:datasecure/model/ForgotpassRequest.dart';
import 'package:datasecure/model/ForgotpassResponse.dart';
import 'package:flutter/material.dart';
import 'package:datasecure/global/global.dart' as globals;
import 'package:sweetalert/sweetalert.dart';
import 'forgotpass_2.dart';


class Forgotpassword extends StatefulWidget {
  @override
  _ForgotpasswordState createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {

  final _formKey = GlobalKey<FormState>();
  final api = API();
  TextEditingController controllerEmail = TextEditingController();

  forgotPassemail() async {
    if (_formKey.currentState.validate()) {
      String email = controllerEmail.text;
      ForgotpassResponse res =
      await api.forgotpass(ForgotpassRequest(email: email));
      // globals.resetpassEmail=email;
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => Forgotpasswordemail()));
      if(globals.status == "200"){
        if (res.resposne=="Found email") {
          globals.resetpassEmail = res.responseEmail;
          print(globals.resetpassEmail);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Forgotpasswordemail()));
        }else{
          SweetAlert.show(
            context,
            title: "Error",
            subtitle: "Forgot password failed!",
            style: SweetAlertStyle.error,
          );
        }
      }else{
        SweetAlert.show(
          context,
          title: "Error",
          subtitle: "Forgot password failed!",
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
                              child: Image.asset('assests/images/masterkey.png'),
                            ),
                          ),
                          SizedBox(height: _height*0.05,),
                          Text(
                            'Getting back into your account',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _height*0.05,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: _height / 40.0)),

                          TextFormField(
                            validator: (String value) {
                              if (value.isEmpty) return '*Please enter Email';
                              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) return 'Please a valid Email';
                            },
                            style: TextStyle(fontSize: _height*0.025,color: Color(0xFF7ebafe)),
                            controller: controllerEmail,
                            obscureText: false,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: _height*0.019),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0xFF7ebafe),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFF2f3146),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: _height*0.009),
                          Text("Tell us some information about your account.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: _height*0.02,)),
                          Padding(padding: EdgeInsets.only(top: _height*0.1)),
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
                                "Continue",
                                style: TextStyle(
                                    fontSize: _height*0.035,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            onTap: () => {forgotPassemail()},
                          ),                        ]),
                      )),
                ),
                // ),
              )
            ],
        )
    );
  }
}
