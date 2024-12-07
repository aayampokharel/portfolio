import 'package:flutter/material.dart';
import 'package:port/container_controller.dart';
import 'package:port/text_controller.dart';

Widget HelloWidget(BuildContext context) {
  return Container(
    //color:Colors.red,
    height: 500,
    width: MediaQuery.of(context).size.width * 0.65,
    //color: Colors.red,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
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
      ),
    ),
  );
}
