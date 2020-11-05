
import 'package:datasecure/doing/historical_screen.dart';
import 'package:datasecure/screens/account_screen.dart';
import 'package:datasecure/screens/caesarshift_screen.dart';
import 'package:datasecure/screens/home_screen.dart';
import 'package:datasecure/screens/polyalphabetic_screen.dart';
import 'package:datasecure/screens/setting_screen.dart';
import 'package:datasecure/screens/vigenerecipher_screen.dart';
import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';

import 'monoalphabetic_screen.dart';

class IndexScreen extends StatefulWidget {

  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State <IndexScreen>{
  int currentIndex=0;
  List pages =[HomeScreen(),AccountScreen(),SettingScreen()];


  @override
  Widget build(BuildContext context) {
    final _heigth = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    Widget bottomNavBar = BottomNavigationBar(


      backgroundColor: Color(0xFF050638),
      currentIndex: currentIndex,
      onTap: (int index){
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,),
            title: Text('Home',style: TextStyle(
                color: Colors.white
            ),)),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle,color: Colors.white),
            title: Text('Profile',style: TextStyle(
                color: Colors.white
            ),)),
        BottomNavigationBarItem(icon: Icon(Icons.settings,color: Colors.white),
            title: Text('Setting',style: TextStyle(
              color: Colors.white
            ),)),

      ],
    );

    Widget myDrawer= Drawer(
      
      child: Container(
        color: Color(0xFF050638),
        child: ListView(

          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white70,
                child: Text(
                    'FL',
                  style: TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 40
                  ),
                ),
              ),
              accountName: Text('Firstname Lastname',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),),
              accountEmail: Text('emailaddress@gmail.com',style: TextStyle(
                fontSize: 18
              ),),

              decoration: BoxDecoration(
                color: Color(0xFF050638),
              ),
            ),
            ListTile(
              tileColor: Color(0xFF050638),
              leading: Icon(Icons.book,color: Colors.white,),
              title: Text('Historical Cipher',style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
              ),
              ),

              trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HistoricalScreen()));
              },
            ),
            Divider(),
            ListTile(
              tileColor: Color(0xFF050638),
              leading: Icon(Icons.book,color: Colors.white,),
              title: Text('Shift Cipher',style: TextStyle(
                fontSize: 16,
                color: Colors.white
              ),
              ),
              subtitle: Text('(The Caesar Cipher)',style: TextStyle(
                  color: Colors.white
              ),),
              trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CaesarShiftScreen()));
              },
            ),
            ListTile(

              tileColor: Color(0xFF050638),
              leading: Icon(Icons.book,color: Colors.white,),
              title: Text('A Mono-alphabetic Substitution Cipher',style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
              ),
              ),

              trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MonoAlphabeticScreen()));
              },
            ),
            ListTile(

              tileColor: Color(0xFF050638),
              leading: Icon(Icons.book,color: Colors.white,),
              title: Text('A Polyalphabetic Substitution Cipher',style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
              ),
              ),

              trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PolyalphabeticScreen()));
              },
            ),
            ListTile(

              tileColor: Color(0xFF050638),
              leading: Icon(Icons.book,color: Colors.white,),
              title: Text('Vigenère Cipher',style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
              ),
              ),

              trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => VigenereCipherScreen()));
              },
            ),
            ListTile(

              tileColor: Color(0xFF050638),
              leading: Icon(Icons.book,color: Colors.white,),
              title: Text('A Permutation Cipher',style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
              ),
              ),

              trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
              onTap: () {
              },
            ),
            ListTile(

              tileColor: Color(0xFF050638),
              leading: Icon(Icons.book,color: Colors.white,),
              title: Text('A One-time Pad',style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
              ),
              ),

              trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
              onTap: () {
              },
            ),


            Divider(height: 4,),
            ListTile(
              tileColor: Color(0xFF050638),
              leading: Icon(Icons.settings,color: Colors.white,),
              title: Text('Sing out',style: TextStyle(
                  fontSize: 20,
                color: Colors.white
              ),
              ),
              subtitle: Text('ออกจากการใช้งาน',style: TextStyle(
                color: Colors.white,
              ),),
              trailing: Icon(Icons.exit_to_app,color: Colors.red,),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      drawer: myDrawer,
      appBar: AppBar(
       title: Text('Data Security'),
        backgroundColor: Color(0xFF050638),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: bottomNavBar,


    );

  }
}