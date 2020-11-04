import 'package:datasecure/doing/caesarShiftCode.dart';
import 'package:flutter/material.dart';

class CaesarShiftScreen extends StatefulWidget {

  _CaesarShiftScreenState createState() => _CaesarShiftScreenState();
}

class _CaesarShiftScreenState extends State <CaesarShiftScreen>{

  @override
  Widget build(BuildContext context) {
    final _heigth = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    
    return Scaffold(
        appBar: AppBar(
          title: Text("The Caesar Shift Cipher"),
          backgroundColor: Color(0xFF19244F),

        ),
        body:  LayoutBuilder(builder: (context,contrains){
          return Container(
            alignment: Alignment.center,
            width: _width,
            height: _heigth,
            color: Color(0xFF19244F),
            padding: EdgeInsets.only(
                top: _heigth*0.034,
                bottom: _heigth*0.02,
                left: _heigth*0.01,
                right: _heigth*0.01
            ),
            child: ListView(
              children: <Widget>[
                Container(

                )
              ],
            ),
          );
        }
        )
    );

  }
}