import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoricalScreen extends StatefulWidget{
  _HistoricalScreenState createState()=> _HistoricalScreenState();

}

class _HistoricalScreenState extends State<HistoricalScreen>{

  @override
  Widget build(BuildContext context) {
    final _heigth = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Historical Cipher',style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFF191a49),
        ),
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
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        height: _heigth*0.06,
                        width: _width,
                        child: Text('Caesar cipher',style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Card(
                        elevation: 20,
                        color: Color(0xFF040526),
                        child: Container(
                          height: _heigth*0.5,
                          width: _width,

                          child: ListView(
                            children: <Widget>[
                              Container(
                                height:_heigth*0.25,
                                width: _width,
                                child: Text("          In cryptography, a Caesar cipher, also known as Caesar's cipher, the shift cipher, Caesar's code or Caesar shift, is one of the simplest and most widely known encryption techniques. It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. For example, with a left shift of 3, D would be replaced by A, E would become B, and so on. The method is named after Julius Caesar, who used it in his private correspondence.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                  ),),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height:_heigth*0.2,
                                width: _width,
                                child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Caesar_cipher_left_shift_of_3.svg/2880px-Caesar_cipher_left_shift_of_3.svg.png')
                                ,),
                              Container(
                                height: _heigth*0.15,
                                width: _width,
                                child: Text('          The action of a Caesar cipher is to replace each plaintext letter with a different one a fixed number of places down the alphabet. The cipher illustrated here uses a left shift of three, so that (for example) each occurrence of E in the plaintext becomes B in the ciphertext.',
                                    style:TextStyle(
                                        color: Colors.white,
                                        fontSize: 16
                                    )),

                              ),


                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: _heigth*0.06,
                        width: _width,
                        child: Text('A Mono - Alphabetic Cipher ',style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Card(
                        elevation: 20,
                        color: Color(0xFF040526),
                        child: Container(
                          height: _heigth*0.5,
                          width: _width,

                          child: ListView(
                            children: <Widget>[
                              Container(
                                height:_heigth*0.48,
                                width: _width,
                                child: Text("          Substitution ciphers are probably the most common form of cipher. They work by replacing each letter of the plaintext (and sometimes puntuation marks and spaces) with another letter (or possibly even a random symbol).\n"
                                    "          A monoalphabetic substitution cipher, also known as a simple substitution cipher, relies on a fixed replacement structure. That is, the substitution is fixed for each letter of the alphabet. Thus, if 'a' is encrypted to 'R', then every time we see the letter 'a' "
                                    "in the plaintext, we replace it with the letter 'R' in the ciphertext.\n"
                                    "          A simple example is where each letter is encrypted as the next letter in the alphabet: 'a simple message' becomes 'B TJNQMF NFTTBHF'. In general, when performing a simple substitution manually, it is easiest to generate the ciphertext alphabet first, and encrypt by comparing this to the plaintext alphabet. The table below shows how one might choose to, and we will, lay them out for this example",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                  ),),
                              ),
                              Container(
                                alignment: Alignment.center,

                                height:_heigth*0.1,
                                width: _width,
                                child: Image.network('https://crypto.interactive-maths.com/uploads/1/1/3/4/11345755/4433929_orig.jpg')
                                ,),
                              Container(
                                height: _heigth*0.3,
                                width: _width,
                                child: Text('          There are many different monoalphabetic substitution ciphers, in fact infinitely many, as each letter can be encrypted to any symbol, not just another letter.\n\n'
                                    "          The history of simple substitution ciphers can be traced back to the very earliest civisilisations, and for a long time they were more than adequate for the purposes for which they were needed. By today's standards they are very weak, and incredibly easy to break, but they were a very important step in developing cryptography.",
                                    style:TextStyle(
                                        color: Colors.white,
                                        fontSize: 16
                                    )),

                              ),


                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: _heigth*0.06,
                        width: _width,
                        child: Text('A Mono - Alphabetic Cipher ',style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Card(
                        elevation: 20,
                        color: Color(0xFF040526),
                        child: Container(
                          height: _heigth*0.5,
                          width: _width,

                          child: ListView(
                            children: <Widget>[
                              Container(
                                height:_heigth*0.48,
                                width: _width,
                                child: Text("          The development of Polyalphabetic Substitution Ciphers was the cryptographers answer to Frequency Analysis. The first known polyalphabetic cipher was the Alberti Cipher invented by Leon Battista Alberti in around 1467. He used a mixed alphabet to encrypt the plaintext, but at random points he would change to a different mixed alphabet, indicating the change with an uppercase letter in the ciphertext. In order to utilise this cipher, "
                                    "Alberti used a cipher disc to show how plaintext letters are related to ciphertext letters.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                  ),),
                              ),



                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: _heigth*0.06,
                        width: _width,
                        child: Text('Vigenère Cipher',style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Card(
                        elevation: 20,
                        color: Color(0xFF040526),
                        child: Container(
                          height: _heigth*0.5,
                          width: _width,

                          child: ListView(
                            children: <Widget>[
                              Container(
                                height:_heigth*0.48,
                                width: _width,
                                child: Text("          The Vigenère cipher (French pronunciation: [viʒnɛːʁ]) is a method of encrypting alphabetic text by using a series of interwoven Caesar ciphers, based on the letters of a keyword. "
                                    "It employs a form of polyalphabetic substitution.\n\n"
                                    "          First described by Giovan Battista Bellaso in 1553, the cipher is easy to understand and implement, but it resisted all attempts to break it until 1863, three centuries later. This earned it the description le chiffre indéchiffrable (French for 'the indecipherable cipher'). Many people have tried to implement encryption schemes that are essentially Vigenère ciphers.[3] In 1863, Friedrich Kasiski was the first to publish a general method of deciphering Vigenère ciphers.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                  ),),
                              ),



                            ],
                          ),
                        ),
                      ),
                    ],
                  )



                ],)
          );

        }
        )

    );

  }
}
