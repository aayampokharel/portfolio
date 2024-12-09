import 'dart:ui';

import 'package:flutter/cupertino.dart';
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

  Widget returnContainer(
      {required Widget? child,
      double? borderRadius,
      String? img,
      double opacity = 0}) {
    if (img != null) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity((opacity >= 0 && opacity <= 1)
                    ? opacity
                    : 0), // Adjust opacity to control darkness
                BlendMode.darken, // Darkens the image
              ),
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 0)),
        constraints: BoxConstraints(
          maxHeight: containerModel.maxHeight,
          maxWidth: containerModel.maxWidth,
          minHeight: containerModel.minHeight,
          minWidth: containerModel.minWidth,
        ),
        child: child,
      );
    }
    return Container(
      decoration: BoxDecoration(
          color: containerModel.color,
          borderRadius: BorderRadius.circular(borderRadius ?? 0)),
      constraints: BoxConstraints(
        maxHeight: containerModel.maxHeight,
        maxWidth: containerModel.maxWidth,
        minHeight: containerModel.minHeight,
        minWidth: containerModel.minWidth,
      ),
      child: child,
    );
  }

  Widget returnCard({required Widget childs}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
              //  key: containerKey,
              decoration: BoxDecoration(
                color: containerModel.color,
                border: Border.all(color: containerModel.color),
                borderRadius: BorderRadius.circular(8.0),
              ),
              constraints: BoxConstraints(
                maxHeight: containerModel.maxHeight,
                maxWidth: double.infinity,
                minHeight: containerModel.minHeight,
                minWidth: containerModel.minWidth,
              ),
              child: null),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 0),
                child: Card(
                  color: Colors.white60.withOpacity(0.6),
                  elevation: 40.0,
                  child: childs,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
