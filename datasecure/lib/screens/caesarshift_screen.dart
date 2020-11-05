import 'package:datasecure/doing/caesarShiftCode.dart';
import 'package:flutter/material.dart';

class CaesarShiftScreen extends StatefulWidget {
  _CaesarShiftScreenState createState() => _CaesarShiftScreenState();
}

class _CaesarShiftScreenState extends State<CaesarShiftScreen> {
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
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('Encryption'),
                ),
                Tab(
                  icon: Text('Decryption'),
                ),
              ],
            ),
            title: Text('Caesar Cipher'),
          ),
          body: TabBarView(
            children: <Widget>[
              //encryption
              Container(
                height: _heigth/2,
                color: Color(0xFF19244F),
                child: Card(
                  child: Form(
                    //key: _formKey,
                    child: ListView(padding: EdgeInsets.all(12), children: <
                        Widget>[
                      ListTile(
                        title: Text(
                          "Plain Text",
                          style: TextStyle(
                              fontSize: _width / 15.0,
                              color: Color(0xFF160c78)),
                        ),
                        enabled: false,
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: TextFormField(
                                        validator: (String value) {
                                          if (value.isEmpty)
                                            return '*Please Enter a input';
                                        },
                                        //controller: controllerprename,

                                        style: TextStyle(
                                            fontSize: _width / 23.0,
                                            fontFamily: 'ThaiSansNeue'),
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Center(
                          child: GestureDetector(
                              //onTap: () => register(selected),
                              child: Container(
                                  width: 500.0,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xff00c6ff),
                                          Color(0xFF5c3dd9)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(5, 5),
                                          blurRadius: 10,
                                        )
                                      ]),
                                  child: Center(
                                      child: Text(
                                    ' Confirm',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: _width / 22.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )))))
                    ]),
                  ),
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
