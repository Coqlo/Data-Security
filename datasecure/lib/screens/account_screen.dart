
import 'package:flutter/material.dart';

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
            color: Color(0xFF050638),
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
                    radius: _heigth,
                    backgroundImage: NetworkImage('https://scontent.fbkk10-1.fna.fbcdn.net/v/t31.0-8/29064575_1775509835821857_2691846861250441171_o.jpg?_nc_cat=103&ccb=2&_nc_sid=174925&_nc_eui2=AeG0NlTVmorwfwPuegP190J2Is8f7qCZBmUizx_uoJkGZVMm89o185dbswustnFSmJZTRCwq8PxGfn7eq_DNPTsh&_nc_ohc=8QzZmfMJLzMAX95pFEf&_nc_ht=scontent.fbkk10-1.fna&oh=497eb3554db7b1feeb89238a04f5d630&oe=5FBFB65B'),
                  ),
                ),
                Card(
                  child: ListTile(
                    tileColor: Color(0xFF050638),
                    leading: Text('Name: ',style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                    title: Text('???????????????????',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue
                    ),),
                  ),
                ),
                Card(
                  child: ListTile(
                    tileColor: Color(0xFF050638),
                    leading: Text('History: ',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                    title: Text('???????????????????????????????????????????????????????????????????????????????????????',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue
                    ),),
                  ),
                ),
                Card(
                  child: ListTile(
                    tileColor: Color(0xFF050638),
                    leading: Text('BirthDay: ',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                    title: Text('???????????????????',style: TextStyle(
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