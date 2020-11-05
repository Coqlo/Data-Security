import 'package:datasecure/model/RegisterRequest.dart';
import 'package:datasecure/model/RegisterResponse.dart';
import 'package:flutter/material.dart';
import 'package:datasecure/global/global.dart' as globals;
import '../../controller/API.dart';
import 'login_screen.dart';
import 'package:sweetalert/sweetalert.dart';

class CreateAccount extends StatefulWidget {
  _CreateAccountScreen createState() => _CreateAccountScreen();
}

class _CreateAccountScreen extends State<CreateAccount> {
  TextEditingController controllerFistname = TextEditingController();
  TextEditingController controllerLastname = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPassConfirm = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final api = API();

  Register() async {
    if (_formKey.currentState.validate()) {
      String fistname = controllerFistname.text;
      String lastname = controllerLastname.text;
      String email = controllerEmail.text;
      String password = controllerPassword.text;
      String passconfirm = controllerPassConfirm.text;
      globals.isLoggedIn = true;
      RegisterResponse res = await api.register(RegisterRequest(
          firstName: fistname,
          lastName: lastname,
          email: email,
          passWord: password));

      // print("doLogin responseUsername :" + res.responseUsername);
      print(res.toString());
      print("status: $res.responseStatus");
      if (globals.status == "200") {
        if (res.response == "Registration Success!!!") {
          SweetAlert.show(context,
              title: "ลงทะเบียนสำเร็จ",
              style: SweetAlertStyle.success, onPress: (bool isConfirm) {
            if (isConfirm) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            }
          });
        } else {
          SweetAlert.show(
            context,
            title: "ลงทะเบียนไม่สำเร็จ",
            subtitle: "กรุณาลองใหม่อีกครั้ง",
            style: SweetAlertStyle.error,
          );
        }
      } else {
        SweetAlert.show(
          context,
          title: "ลงทะเบียนไม่สำเร็จ",
          subtitle: "กรุณาลองใหม่อีกครั้ง",
          style: SweetAlertStyle.error,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _heigth = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: [

          LayoutBuilder(
            builder: (context, contrain) {
              return Container(
                  width: _width,
                  height: _heigth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assests/images/bg.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  padding: EdgeInsets.only(
                    left: _heigth * 0.01,
                    right: _heigth * 0.01,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(_heigth * 0.03),
                    child: Form(
                      key: _formKey,
                      child: ListView(
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
                          Container(
                            height: _heigth / 6,
                            child: Column(
                              children: [
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: _heigth*0.06,
                                      color: Color(0xFFffffff),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: _heigth * 0.02,
                                ),
                                Text(
                                  "Create your account",
                                  style: TextStyle(
                                      fontSize: _heigth*0.03,
                                      color: Color(0xFFffffff),
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            validator: (String value) {
                              if (value.isEmpty) return '*Please enter Firstname';
                            },
                            style: TextStyle(fontSize: _heigth*0.025,color: Color(0xFF7ebafe)),
                            controller: controllerFistname,
                            obscureText: false,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: _heigth*0.019),
                              labelText: 'Firstname',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0xFF7ebafe),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFF2f3146),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: _heigth * 0.009,
                          ),
                          TextFormField(
                            validator: (String value) {
                              if (value.isEmpty) return '*Please enter Lastname';
                            },
                            style: TextStyle(fontSize: _heigth*0.025,color: Color(0xFF7ebafe)),
                            controller: controllerLastname,
                            obscureText: false,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: _heigth*0.019),
                              labelText: 'Lastname',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0xFF7ebafe),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFF2f3146),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: _heigth * 0.009,
                          ),
                          TextFormField(
                            validator: (String value) {
                              if (value.isEmpty) return '*Please enter Email';
                              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) return 'Please a valid Email';
                            },
                            style: TextStyle(fontSize: _heigth*0.025,color: Color(0xFF7ebafe)),
                            controller: controllerEmail,
                            obscureText: false,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: _heigth*0.019),
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
                          SizedBox(
                            height: _heigth * 0.009,
                          ),
                          TextFormField(
                            validator: (String value) {
                              if (value.isEmpty) return '*Please enter Password';
                              if (value.length < 8)
                                return '*Passwords at least 8 char. Please try again';
                              if (!RegExp("^[a-zA-Z0-9]").hasMatch(value))
                                return 'Please a valid Password [A-Z,a-z,0-9]';
                            },
                            style: TextStyle(fontSize: _heigth*0.025,color: Color(0xFF7ebafe)),
                            controller: controllerPassword,
                            obscureText: true,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: _heigth*0.019),
                              labelText: 'Password',
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
                            height: _heigth * 0.009,
                          ),
                          TextFormField(
                            validator: (String value) {
                              if (value.isEmpty) return '*Please confirm password';
                              if (value != controllerPassword.text)
                                return '*Passwords do not match. Please try again';
                              if (value.length < 8)
                                return '*Passwords at least 8 char. Please try again';
                              if (!RegExp("^[a-zA-Z0-9]").hasMatch(value))
                                return 'Please a valid Password [A-Z,a-z,0-9]';
                            },
                            style: TextStyle(fontSize: _heigth*0.025,color: Color(0xFF7ebafe)),
                            controller: controllerPassConfirm,
                            obscureText: true,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: _heigth*0.019),
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
                          SizedBox(
                            height: _heigth * 0.05,
                          ),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Color(0xFF1fdcb2),
                              ),
                              alignment: Alignment.center,
                              height: _heigth * 0.07,
                              width: _width,
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    fontSize: _heigth*0.035,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            onTap: () => {Register()},
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
