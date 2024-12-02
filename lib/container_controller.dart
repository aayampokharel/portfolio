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
