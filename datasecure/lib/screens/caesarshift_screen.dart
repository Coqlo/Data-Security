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
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.bottomLeft,
                          height: _heigth*0.1,
                          width: _width,
                          child: Text('PlainText',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 32
                            ),),
                        ),
                        TextFormField(
                          validator: (String value) {
                            if (value.isEmpty)
                              return 'Please enter a PlainText';
                          },
                          style: Theme.of(context).textTheme.headline6,
                          //controller: controllerPassword,
                          obscureText: true,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(fontSize: 14.0),
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

                  ],
                ),

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