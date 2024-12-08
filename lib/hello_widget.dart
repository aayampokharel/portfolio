import 'package:flutter/material.dart';
import 'package:port/container_controller.dart';
import 'package:port/text_controller.dart';

Widget HelloWidget(BuildContext context) {
  return Container(
    height: 500,
    width: MediaQuery.of(context).size.width * 0.65,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextController.LargeWhite("Hello,  ").returnText(),
              // Use Expanded to fill the remaining space and center the second text
              Flexible(
                child: TextController.LargeWhite("I am Aayam Pokharel,")
                    .returnText(
                  fontFamily: "Cursive",
                ),
              ),
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
      ),
    ),
  );
}
