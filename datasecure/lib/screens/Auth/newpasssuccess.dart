import 'package:flutter/material.dart';

import 'login_screen.dart';

class NewpassSuccess extends StatefulWidget {
  @override
  _NewpassSuccessState createState() => _NewpassSuccessState();
}

class _NewpassSuccessState extends State<NewpassSuccess> {
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
                child: Padding(
                    padding: EdgeInsets.only(
                        top: _height / 15.0,
                        right: _width / 20.0,
                        left: _width / 20.0),
                    child: Container(
                      // child: SingleChildScrollView(
                      child: Column(children: [
                        SizedBox(height: _height*0.09,),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                            height: _height / 4,
                            width: _height / 4,
                            child: Image.asset('assests/images/Success.png'),
                          ),
                        ),
                        SizedBox(
                          height: _height * 0.05,
                        ),
                        Text(
                          'Change password',
                          style: TextStyle(
                            color: Color(0xFF7ebafe),
                            fontSize: _height * 0.055,
                          ),
                        ),
                        Text(
                          'Success!',
                          style: TextStyle(
                            color: Color(0xFF7ebafe),
                            fontSize: _height * 0.055,
                          ),
                        ),
                        SizedBox(height: _height * 0.05),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Color(0xFFe4357e),
                            ),
                            alignment: Alignment.center,
                            height: _height * 0.07,
                            width: _width,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: _height * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          onTap: () => {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()))
                          },
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
