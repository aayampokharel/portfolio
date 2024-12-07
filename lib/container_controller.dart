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
    containerModel.maxHeight = maxHeight ?? double.infinity;
    containerModel.maxWidth = maxWidth ?? double.infinity;
    containerModel.minHeight = minHeight ?? 0;
    containerModel.minWidth = minWidth ?? 0;
    containerModel.color = color ?? Colors.black;
  }

  ContainerController.button({
    Color? buttonColor,
  }) {
    containerModel.color = buttonColor ?? Colors.transparent;
  }

  Widget returnButton({
    required Text text,
    required Function? fnctToRun,
    int? indexOfReposInList,
    double? padding,
    double? borderRadius,
    Color? borderColor,
  }) {
    return ElevatedButton(
      onPressed: () {
        fnctToRun?.call(indexOfReposInList ?? 0);
        //@ this fnct runs if itsnot null.
      },
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

  Widget returnContainer({
    required Widget child,
  }) {
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

  Widget returnCard({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //  key: containerKey,
        color: containerModel.color,
        constraints: BoxConstraints(
          maxHeight: containerModel.maxHeight,
          maxWidth: containerModel.maxWidth,
          minHeight: containerModel.minHeight,
          minWidth: containerModel.minWidth,
        ),
        child: Card(
          child: child,
        ),
      ),
    );
  }
}
