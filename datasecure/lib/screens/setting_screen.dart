
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {

  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State <SettingScreen>{



  @override
  Widget build(BuildContext context) {
    final _heigth = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;


    return Scaffold(
        body:  LayoutBuilder(builder: (context,contrains){
          return Container(
            alignment: Alignment.center,
            width: _width,
            height: _heigth,
            color: Color(0xFF050638),
            padding: EdgeInsets.only(
                top: _heigth*0.034,
                bottom: _heigth*0.02,
                left: _heigth*0.01,
                right: _heigth*0.01
            ),
            child: Text('setting Screen'),
          );

        }
        )

    );

  }
}