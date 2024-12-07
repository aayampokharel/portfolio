import 'package:flutter/material.dart';
import 'package:port/text_model.dart';

class TextController {
  TextModel model = TextModel();
  String text;
  TextController(this.text);
  TextController.mediumWhite(this.text) {
    model.text = text;
    model.fontSize = 20;
    model.color = Colors.white;
  }

  //@ aba sabbai lai esari add garera hunna .have a named constructur = .custom and inside have required params and set the values .
  TextController.LargeWhite(this.text) {
    model.text = text;
    model.fontFamily = "Urbanist";
    model.fontSize = 40;
    model.color = Colors.white;
  }
  TextController.smallBlack(this.text) {
    model.text = text;
    model.fontSize = 18;
    model.color = Colors.black;
  }
  TextController.LargeGreen(this.text) {
    model.text = text;
    model.fontSize = 30;
    model.color = Colors.green;
  }

  TextController.custom(this.text,
      {Color color = Colors.black, double fontSize = 10}) {
    model.text = text;
    model.color = color;
    model.fontSize = fontSize;
  }

  Text returnText({bool justify = false, String fontFamily = "Inter"}) {
    model.fontFamily = fontFamily;
    return Text(
      model.text,
      style: TextStyle(
          //fontFamily: "Cursive",
          fontFamily: model.fontFamily,
          fontSize: model.fontSize,
          color: model.color),
      textAlign: justify ? TextAlign.justify : TextAlign.left,
      softWrap: true,
      overflow: TextOverflow.visible,
    );
  }
}
