import 'package:flutter/material.dart';

class CaesarShift {
  String text;
  int key;

  CaesarShift(String text, int key) {
    this.key = key;
    this.text = text;
  }

  String getText() {
    return this.text;
  }

  int getKey() {
    return this.key;
  }

  void setText(String text) {
    this.text = text;
  }

  void setKey(int key) {
    this.key = key;
  }

  String caesarEncrypt(String text, int key) {
    String output="";
    int num;
    int lent = text.length;
    //print(String.fromCharCode(65));
    for (int i = 0; i < lent; i++) {

     // print(((text.codeUnitAt(i)-65)+key)%26);
      num=((text.codeUnitAt(i)-65)+key)%26;
      num=num+65;
      output+=String.fromCharCode(num);
    }
    return output;
  }

  String caesarDecrypt(String text, int key) {
    String output="";
    int num;
    int lent = text.length;
    //print(String.fromCharCode(65));
    for (int i = 0; i < lent; i++) {

      // print(((text.codeUnitAt(i)-65)+key)%26);
      num=((text.codeUnitAt(i)-65)-key)%26;
      num=num+65;
      output+=String.fromCharCode(num);
    }
    return output;
  }

}
