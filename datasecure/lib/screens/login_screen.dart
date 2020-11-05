import 'package:datasecure/controller/API.dart';
import 'package:datasecure/model/LoginRequest.dart';
import 'package:datasecure/model/LoginResponse.dart';
import 'package:datasecure/screens/index_screen.dart';
import 'package:flutter/material.dart';
import 'package:datasecure/global/global.dart' as globals;
import 'package:sweetalert/sweetalert.dart';

import 'createAccount_screen.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final api = API();

  Login() async {
    if (_formKey.currentState.validate()) {
      String username = controllerUsername.text;
      String password = controllerPassword.text;
      LoginResponse res =
          await api.login(LoginRequest(username: username, password: password));
      if (globals.status == "200") {
        if (res.response == "login success") {
          if (res.utypeid == 1) {
            globals.firstname = res.firstname;
            Navigator.pushNamed(context, '/home-staff-page');
          } else {
            if (res.utypeid == 2) {
              globals.firstname = res.firstname;
              Navigator.pushNamed(context, '/home-student-page');
            } else {
              if (res.utypeid == 3) {
                globals.firstname = res.firstname;
                Navigator.pushNamed(context, '/home-professor-page');
              }
            }
          }
        } else {
          SweetAlert.show(
            context,
            title: "Error",
            subtitle: "Login Failed",
            style: SweetAlertStyle.error,
          );
        }
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
                          SizedBox(
                            height: _heigth / 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              alignment: Alignment.center,
                              height: _heigth / 4,
                              width: _heigth / 4,
                              child: Image.asset('assests/images/logo.png'),
                            ),
                          ),
                          SizedBox(
                            height: _heigth * 0.009,
                          ),
                          Container(
                            height: _heigth / 10,
                            child: Column(
                              children: [
                                Text(
                                  "Butterfly Team",
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Color(0xFFffffff),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            validator: (String value) {
                              if (value.isEmpty) return '*Please enter Email';
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value))
                                return 'Please a valid Email';
                            },
                            style: TextStyle(
                                fontSize: 20, color: Color(0xFF7ebafe)),
                            controller: controllerUsername,
                            obscureText: false,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 14.0),
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
                              if (value.isEmpty)
                                return '*Please enter Password';
                              if (value.length < 8)
                                return '*Passwords at least 8 char. Please try again';
                              if (!RegExp("^[a-zA-Z0-9]").hasMatch(value))
                                return 'Please a valid Password [A-Z,a-z,0-9]';
                            },
                            style: TextStyle(
                                fontSize: 20, color: Color(0xFF7ebafe)),
                            controller: controllerPassword,
                            obscureText: true,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 14.0),
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
                                "Login",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            onTap: () => {Login()},
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "don't have an account?",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                              FlatButton(
                                  onPressed: () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CreateAccount()))
                                      },
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xFF7ebafe),
                                    ),
                                  )),
                            ],
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
