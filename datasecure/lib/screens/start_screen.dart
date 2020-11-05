import 'file:///D:/Work/DataSe/Data-Security/datasecure/lib/screens/Auth/login_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {

  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State <StartScreen>{

  @override
  Widget build(BuildContext context) {
    final _heigth = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: _heigth*0.945,
                width: _width,
                color: Color(0xFF050638),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: _heigth*0.15,
                      width: _width,

                    ),
                    Container(
                      alignment: Alignment.center,
                      height: _heigth*0.3,
                      width: _width,
                      child: Image(image: AssetImage('assests/images/data-logo.png'),)
                    ),
                    Container(
                      alignment: Alignment.center,
                        height: _heigth*0.08,
                      width: _width,

                      child: Text('Welcom to my application !',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white
                      ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: _heigth*0.09,
                      width: _width,

                      child: Text('Data security refers to the process of protecting data from unauthorized access and data corruption throughout its lifecycle. ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                    ),
                    Container(
                      height: _heigth*0.05,
                      width: _width,


                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: _heigth*0.01,
                        bottom: _heigth*0.01,
                        left: _heigth*0.05,
                        right: _heigth*0.05
                      ),
                      height: _heigth*0.09,
                      width: _width,

                      child: Column(
                        children: <Widget>[
                          InkWell(
                            child: Container(
                              height: _heigth*0.07,
                              width: _width,
                              color: Colors.teal,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: _heigth,
                                    width: _width*0.165,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: _heigth,
                                    width: _width*0.4,
                                    color: Colors.teal,
                                    child: Text('Get Started',style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),),
                                  ),
                                  Container(
                                    height: _heigth,
                                    width: _width*0.15,
                                    child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                                  )
                                ],
                              ),


                            ),
                            onTap: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
                          )
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