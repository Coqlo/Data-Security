import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget{
  _CreateAccountScreen createState()=> _CreateAccountScreen();

}





class _CreateAccountScreen extends State<CreateAccount>{
  @override
  Widget build(BuildContext context) {
    final _heigth = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
        backgroundColor: Color(0xFF19244F),
      ),
      resizeToAvoidBottomPadding: false,
      body: LayoutBuilder(builder: (context,contrain){
        return Container(
          width: _width,
          height: _heigth,
          color: Color(0xFF19244F),
          padding: EdgeInsets.only(
              top: _heigth*0.034,
              bottom: _heigth*0.02,
              left: _heigth*0.01,
              right: _heigth*0.01,

          ),
          child: ListView(
            children: <Widget>[
              Divider(height: _heigth*0.03,),
              Card(
                child: Container(
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty)
                        return 'Please enter a Firstname';
                    },
                    style: Theme.of(context).textTheme.headline6,
                    //controller: controllerPassword,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 14.0),
                      labelText: 'Firtname',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.blueAccent,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2)
                      ),
                      filled: true,
                      fillColor: Colors.white30,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              Divider(),
              Card(
                child: Container(
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty)
                        return 'Please enter a Lastname';
                    },
                    style: Theme.of(context).textTheme.headline6,
                    //controller: controllerPassword,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 14.0),
                      labelText: 'Lastname',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.blueAccent,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2)
                      ),
                      filled: true,
                      fillColor: Colors.white30,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),


            ],
          )

        );
      },),

    );

  }
}