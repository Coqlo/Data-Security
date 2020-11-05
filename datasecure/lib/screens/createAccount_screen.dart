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
        backgroundColor: Color(0xFF050638),
      ),
      resizeToAvoidBottomPadding: false,
      body: LayoutBuilder(builder: (context,contrain){
        return Container(
          width: _width,
          height: _heigth,
          color: Color(0xFF050638),
          padding: EdgeInsets.only(
              top: _heigth*0.034,
              bottom: _heigth*0.02,
              left: _heigth*0.01,
              right: _heigth*0.01,

          ),
          child: Padding(
            padding: EdgeInsets.all(_heigth*0.03),
            child: ListView(
              children: <Widget>[
                Container(
                  height: _heigth/6,
                  child: Column(
                    children: [
                      Text("Sign Up",style: TextStyle(fontSize: 45,color: Color(0xff00c6ff),fontWeight: FontWeight.bold),),
                      SizedBox(height: _heigth*0.02,),
                      Text("Create your account",style: TextStyle(fontSize: 20,color: Color(0xff00c6ff),fontWeight: FontWeight.normal),),
                    ],
                  ),
                ),
                TextFormField(
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
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: _heigth*0.009,),
                TextFormField(
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
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: _heigth*0.009,),
                TextFormField(
                  validator: (String value) {
                    if (value.isEmpty)
                      return 'Please enter a Email';
                  },
                  style: Theme.of(context).textTheme.headline6,
                  //controller: controllerPassword,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(fontSize: 14.0),
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: _heigth*0.009,),
                TextFormField(
                  validator: (String value) {
                    if (value.isEmpty)
                      return 'Please enter a Password';
                  },
                  style: Theme.of(context).textTheme.headline6,
                  //controller: controllerPassword,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(fontSize: 14.0),
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                    filled: true,
                    fillColor: Colors.white,

                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: _heigth*0.009,),

                TextFormField(
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
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: _heigth*0.05,),

                Container(
                  height: _heigth / 13,
                  child: RaisedButton(
                    //onPressed: () => forgotPassemail(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          color: Color(0xff00c6ff),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: 300.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Confirm",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            //fontFamily: 'ThaiSansNeue',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),



              ],
            ),
          )
        );
      },),

    );

  }
}