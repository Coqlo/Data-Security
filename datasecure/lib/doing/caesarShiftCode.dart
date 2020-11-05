import 'dart:convert';

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
    String output;
    int lent = text.length;
    for (int i = 0; i < lent; i++) {

    }
  }
}
