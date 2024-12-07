import 'package:flutter/material.dart';
import 'package:port/container_controller.dart';
import 'package:port/text_controller.dart';

Widget HelloWidget() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max, // Center both text elements
        children: [
          TextController.LargeWhite("Hello,  ").returnText(),
          // Use Expanded to fill the remaining space and center the second text
          Flexible(
              child: TextController.LargeWhite("I am Aayam Pokharel,")
                  .returnText()),
        ],
      ),
      TextController.mediumWhite("A Full Stack Developer ,").returnText(),
      const SizedBox(
        height: 10,
      ),
      ContainerController.button(buttonColor: Colors.green).returnButton(
        text: TextController.mediumWhite("review").returnText(),
        fnctToRun: null,
        padding: 15,
        borderRadius: 10,
        borderColor: Colors.black45,
      ),
    ],
  );
}
