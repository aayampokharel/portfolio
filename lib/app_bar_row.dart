import 'package:flutter/widgets.dart';
import 'package:port/text_controller.dart';

Widget appBarRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextController.LargeWhite("  AAYAM P.").returnText(),
      Row(
        children: [
          TextController.mediumWhite("HOME").returnText(),
          const SizedBox(
            width: 20,
          ),
          TextController.mediumWhite("ABOUT").returnText(),
          const SizedBox(
            width: 20,
          ),
          TextController.mediumWhite("SIGN IN").returnText(),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    ],
  );
}
