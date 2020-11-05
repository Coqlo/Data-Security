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

    
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF19244F),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            bottom: TabBar(
              tabs: [
                Tab(child: Text('Encryption'),),
                Tab(icon: Text('Decryption'),),

              ],
            ),
            title: Text('Caesar Cipher'),
          ),
          body: TabBarView(
            children: <Widget>[
              //encryption
              Container(
                color: Color(0xFF19244F),

              ),





              //decryption
              Container(
                color: Color(0xFF19244F),

              ),

            ],
          ),
        ),
      ),
    );
  }
}