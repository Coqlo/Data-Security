import 'package:flutter/material.dart';
import 'package:datasecure/global/global.dart' as globals;


class AccountScreen extends StatefulWidget {
  _AccountScreenState createState() => _AccountScreenState();
}
class _AccountScreenState extends State <AccountScreen>{

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
            color: Color(0xFF040526),
            padding: EdgeInsets.only(
                top: _heigth*0.034,
                bottom: _heigth*0.02,
                left: _heigth*0.01,
                right: _heigth*0.01
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: _heigth*0.2,
                  width: _width,

                  child: CircleAvatar(
                    //radius: _heigth,
                    maxRadius: 80,
                    minRadius: 80,
                    backgroundImage: AssetImage("assests/images/logo250.png"),
                  ),
                ),
                SizedBox(height: _heigth*0.05,),
                Card(
                  child: ListTile(
                    tileColor: Color(0xFF191a49),
                    leading: Text('Name: ',style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                    title: Text('${globals.firstname}\t\t${globals.lastname}',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFe4357e)
                    ),),
                  ),
                ),
                Card(
                  child: ListTile(
                    tileColor: Color(0xFF191a49),
                    leading: Text('Email: ',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                    title: Text('${globals.email}',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue
                    ),),
                  ),
                ),
                Card(
                  child: ListTile(
                    tileColor: Color(0xFF191a49),
                    leading: Text('History: ',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                    title: Text('Studies Computer Engineering at Faculty of Engineering at Kamphaeng Saen Kasetsart University',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue
                    ),),
                  ),
                ),
                Card(
                  child: ListTile(
                    tileColor: Color(0xFF191a49),
                    leading: Text('BirthDay: ',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                    title: Text('05\tAugust\t1998',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue
                    ),),
                  ),
                )
              ],
            )
          );
        }
        )
    );

  }
}