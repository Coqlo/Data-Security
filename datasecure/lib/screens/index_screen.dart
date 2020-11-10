
import 'package:datasecure/doing/historical_screen.dart';
import 'package:datasecure/screens/Auth/login_screen.dart';
import 'package:datasecure/screens/account_screen.dart';
import 'package:datasecure/screens/caesarshift_screen.dart';
import 'package:datasecure/screens/home_screen.dart';
import 'package:datasecure/screens/polyalphabetic_screen.dart';
import 'package:datasecure/screens/setting_screen.dart';
import 'package:datasecure/screens/vigenerecipher_screen.dart';
import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:datasecure/global/global.dart' as globals;

import 'monoalphabetic_screen.dart';

class IndexScreen extends StatefulWidget {

  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State <IndexScreen>{
  int currentIndex=0;
  List pages =[HomeScreen(),AccountScreen(),HomePage()];


  @override
  Widget build(BuildContext context) {
    final _heigth = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    Widget bottomNavBar = BottomNavigationBar(


      backgroundColor: Color(0xFF191a49),
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
        color: Color(0xFF191a49),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assests/images/logo.png"),
              ),
              accountName: Text('${globals.firstname}\t\t${globals.lastname}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,color: Color(0xFF7ebafe)
              ),),
              accountEmail: Text('${globals.email}',style: TextStyle(
                fontSize: 18,color: Colors.white
              ),),

              decoration: BoxDecoration(
                color: Color(0xFF191a49),
              ),
            ),
            ListTile(
              tileColor: Color(0xFF191a49),
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
              tileColor: Color(0xFF191a49),
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

              tileColor: Color(0xFF191a49),
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

              tileColor: Color(0xFF191a49),
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

              tileColor: Color(0xFF191a49),
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

              tileColor: Color(0xFF191a49),
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

              tileColor: Color(0xFF191a49),
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
              tileColor: Color(0xFF191a49),
              leading: Icon(Icons.exit_to_app,color: Colors.redAccent,),
              title: Text('Logout',style: TextStyle(
                  fontSize: 20,
                color: Colors.white
              ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right,color: Colors.red,),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      drawer: myDrawer,
      appBar: AppBar(
       title: Text('Data Security',style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF191a49),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: bottomNavBar,


    );

  }
}