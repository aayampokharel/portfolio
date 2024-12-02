import 'package:flutter/material.dart';

class TextModel {
  String text;
  Color color;
  String fontFamily;
  double? fontSize;
  TextModel(
      {this.text = "noTextEntered",
      this.color = Colors.white,
      this.fontFamily = "Arial",
      this.fontSize = 20});
}
