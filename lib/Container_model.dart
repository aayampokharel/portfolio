import 'package:flutter/material.dart';

class ContainerModel {
  double maxHeight;
  double maxWidth;
  double minWidth;
  double minHeight;
  Color color;

  ContainerModel(
      {this.maxHeight = 0,
      this.maxWidth = 0,
      this.minWidth = 0,
      this.minHeight = 0,
      this.color = Colors.black});
}
