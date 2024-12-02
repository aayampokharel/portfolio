import 'package:flutter/widgets.dart';
import 'package:port/Container_model.dart';
import 'package:flutter/material.dart';

class ContainerController {
  ContainerModel containerModel = ContainerModel();
//~Container and data are models here and these as the name suggest consist of logic that is controller.
  ContainerController.sizing(
      {double? maxHeight,
      double? maxWidth,
      double? minWidth,
      double? minHeight,
      Color? color}) {
    containerModel.maxHeight = maxHeight ?? 0;
    containerModel.maxWidth = maxWidth ?? 0;
    containerModel.minHeight = minHeight ?? 0;
    containerModel.minWidth = minWidth ?? 0;
    containerModel.color = color ?? Colors.black;
  }

  ContainerController.button({
    Color? buttonColor,
  }) {
    containerModel.color = buttonColor ?? Colors.transparent;
  }

  //below button ko lagi mathi chuteko bata we need  to have as parameters: border radius, text, padding ,
  Widget returnButton({
    required Text text,
    required Function? fnctToRun,
    double? padding,
    double? borderRadius,
    Color? borderColor,
  }) {
    return ElevatedButton(
      onPressed: () {
        fnctToRun?.call();
        //@ this fnct runs if itsnot null.
      },
      //color: containerModel.color,
      // padding: EdgeInsets.all(padding ?? 10),
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.all(padding ?? 10),
        ),
        alignment: Alignment.center,
        backgroundColor: MaterialStateProperty.all(containerModel.color),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              side: BorderSide(color: borderColor ?? Colors.black)),
        ),
      ),
      child: text,
    );
  }

  Widget returnContainer({required Widget child}) {
    return Container(
      child: child,
      color: containerModel.color,
      constraints: BoxConstraints(
        maxHeight: containerModel.maxHeight,
        maxWidth: containerModel.maxWidth,
        minHeight: containerModel.minHeight,
        minWidth: containerModel.minWidth,
      ),
    );
  }
}
