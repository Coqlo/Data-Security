import 'package:datasecure/controller/API.dart';
import 'package:datasecure/model/NewpassRequest.dart';
import 'package:datasecure/model/NewpassResponse.dart';
import 'package:flutter/material.dart';
import 'package:datasecure/global/global.dart' as globals;
import 'package:sweetalert/sweetalert.dart';

import 'newpasssuccess.dart';


class Forgotnewpassword extends StatefulWidget {
  @override
  _ForgotnewpasswordState createState() => _ForgotnewpasswordState();
}

class _ForgotnewpasswordState extends State<Forgotnewpassword> {
  final _formKey = GlobalKey<FormState>();
  final api = API();
  TextEditingController controllerPass1 = TextEditingController();
  TextEditingController controllerPass2 = TextEditingController();

  forgotPassemail() async {
    if (_formKey.currentState.validate()) {
      String pass = controllerPass2.text;
      NewpassResponse res =
      await api.newpass(NewpassRequest(email: globals.resetpassEmail,otp: globals.OTP,passWord: pass));

      if(globals.status == "200"){
        if (res.response=="Reset Password Sccess") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewpassSuccess()));
        }else{
          SweetAlert.show(
            context,
            title: "Error",
            subtitle: "Change password failed!",
            style: SweetAlertStyle.error,
          );
        }
      }else{
        SweetAlert.show(
          context,
          title: "Error",
          subtitle: "Change password failed!",
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
                          'Change password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: _height*0.05,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: _height / 40.0)),

                        TextFormField(
                          validator: (String value) {
                            if (value.isEmpty) return '*Please enter Password';
                            if (value.length < 8)
                              return '*Passwords at least 8 char. Please try again';
                            if (!RegExp("^[a-zA-Z0-9]").hasMatch(value))
                              return 'Please a valid Password [A-Z,a-z,0-9]';
                          },
                          style: TextStyle(fontSize: _height*0.025,color: Color(0xFF7ebafe)),
                          controller: controllerPass1,
                          obscureText: true,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(fontSize: _height*0.019),
                            labelText: 'New Password',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Color(0xFF7ebafe),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(),
                            ),
                            filled: true,
                            fillColor: Color(0xFF2f3146),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: _height * 0.009,
                        ),
                        TextFormField(
                          validator: (String value) {
                            if (value.isEmpty) return '*Please confirm password';
                            if (value != controllerPass1.text)
                              return '*Passwords do not match. Please try again';
                            if (value.length < 8)
                              return '*Passwords at least 8 char. Please try again';
                            if (!RegExp("^[a-zA-Z0-9]").hasMatch(value))
                              return 'Please a valid Password [A-Z,a-z,0-9]';
                          },
                          style: TextStyle(fontSize: _height*0.025,color: Color(0xFF7ebafe)),
                          controller: controllerPass2,
                          obscureText: true,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(fontSize: _height*0.019),
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Color(0xFF7ebafe),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(),
                            ),
                            filled: true,
                            fillColor: Color(0xFF2f3146),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: _height*0.009),
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
                              "Confirm",
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
