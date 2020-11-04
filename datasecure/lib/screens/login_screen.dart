import 'package:datasecure/screens/index_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State <LoginScreen>{

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
          color: Color(0xFF19244F),
          padding: EdgeInsets.only(
            top: _heigth*0.034,
            bottom: _heigth*0.02,
            left: _heigth*0.01,
            right: _heigth*0.01
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: _heigth*0.945,
                width: _width,
                color: Color(0xFF19244F),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      height: _heigth*0.1,
                      width: _width,
                      color: Color(0xFF19244F),
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
                      height: _heigth*0.2,
                      width: _width,

                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent,width: 3)
                            ),
                            height: _heigth*0.07,
                            width: _width,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  height: _heigth,
                                  width: _width*0.15,
                                  child: Icon(Icons.account_circle,
                                    size: 49,
                                  color: Colors.white,),
                                ),
                                Container(
                                  height: _heigth,
                                  width: _width*0.734,

                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: 'Username',
                                      labelStyle: TextStyle(
                                        fontSize: 20,
                                          color: Colors.white
                                      )


                                    ),

                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: _heigth*0.03,
                            width: _width,
                            
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent,width: 3)
                            ),
                            height: _heigth*0.07,
                            width: _width,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  height: _heigth,
                                  width: _width*0.15,
                                  child: Icon(Icons.lock,
                                    size: 49,
                                    color: Colors.white,),
                                ),
                                Container(
                                  height: _heigth,
                                  width: _width*0.734,

                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                            fontSize: 20,
                                          color: Colors.white
                                        )
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ),

                        ],
                      ),
                    ),
                    Container(
                        height: _heigth*0.015,
                        width: _width,

                    ),
                    Container(
                        padding: EdgeInsets.all(12),
                      height: _heigth*0.18,
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
                              child: Text("Create Account",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                              ),
                            ),
                            onTap: (){},
                          ),
                        ],
                      ),
                    ),


                  ],
                ),

              )
            ],
          ),
        );
      }),
    );

  }}