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

class _LoginScreenState extends State <LoginScreen>{

  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final api = API();

  Login() async {
    if (_formKey.currentState.validate()) {
      String username = controllerUsername.text;
      String password = controllerPassword.text;
      LoginResponse res = await api
          .login(LoginRequest(username: username, password: password));
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
      body:  LayoutBuilder(builder: (context,contrains){
        return Container(
          width: _width,
          height: _heigth,
          color: Color(0xFF050638),
          padding: EdgeInsets.only(
            top: _heigth*0.034,
            bottom: _heigth*0.02,
            left: _heigth*0.01,
            right: _heigth*0.01
          ),
          child: Container(
            height: _heigth*0.945,
            width: _width,
            color: Color(0xFF050638),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  height: _heigth*0.1,
                  width: _width,
                  color: Color(0xFF050638),
                  child: IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,),
                  )
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: _heigth*0.18,
                  width: _width,
                  child: Text('Please sign in to application and continue...',style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: _heigth*0.11,
                  width: _width,
                  child: Text('Enter your username and password below to continue to the 2wntJ developer and the lerning begin',style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                  ),),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  height: _heigth/4,
                  width: _width,

                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (String value) {
                          if (value.isEmpty)
                            return 'Please enter a Username';
                        },
                        style: Theme.of(context).textTheme.headline6,
                        controller: controllerUsername,
                        obscureText: true,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 14.0),
                          labelText: 'Username',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)
                          ),

                          filled: true,
                          fillColor: Colors.white30,
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        validator: (String value) {
                          if (value.isEmpty)
                            return 'Please enter a password';
                        },
                        style: Theme.of(context).textTheme.headline6,
                        controller: controllerPassword,
                        obscureText: true,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 14.0),
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2)
                          ),
                          filled: true,
                          fillColor: Colors.white30,
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: _heigth*0.05,),
                Container(
                    padding: EdgeInsets.all(12),
                  //height: _heigth*0.2,
                  width: _width,

                  child: Column(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          height: _heigth*0.07,
                          width: _width,
                          color: Colors.cyanAccent,
                          child: Text("Login",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                          ),
                        ),
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => IndexScreen()));
                        },
                      ),
                      Container(
                        height: _heigth*0.01,
                        width: _width,
                      ),
                      InkWell(

                        child: Container(
                          alignment: Alignment.center,
                          height: _heigth*0.07,
                          width: _width,
                          color: Colors.blueAccent,
                          child: Text("Sign up",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                          ),
                        ),
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => CreateAccount()));
                        },
                      ),
                    ],
                  ),
                ),


              ],
            ),

          ),
        );
      }),
    );

  }}