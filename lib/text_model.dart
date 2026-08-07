import 'package:flutter/material.dart';

class TextModel {
  String text;
  Color color;
  String fontFamily;
  double? fontSize;
  FontWeight fontWeight;
  double letterSpacing;
  TextModel(
      {this.text = "noTextEntered",
      this.color = Colors.white,
      this.fontFamily = "Inter",
      this.fontSize = 20,
      this.fontWeight = FontWeight.normal,
      this.letterSpacing = 0});
}
