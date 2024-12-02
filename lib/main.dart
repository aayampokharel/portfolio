import 'package:flutter/material.dart';
import 'package:port/container_controller.dart';
import 'package:port/text_controller.dart';
import 'package:port/text_model.dart';

void main() {
  runApp(portfolio());
}

class portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
    );
  }
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   leading: Row(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(20.0),
      //         child: TextController.LargeWhite("AAYAM P.").returnText(),
      //       )
      //     ],
      //   ),
      //   actions: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       crossAxisAlignment: CrossAxisAlignment.end,
      //       children: [
      //         TextController.mediumWhite("Home").returnText(),
      //         SizedBox(width: 20),
      //         TextController.mediumWhite("About").returnText(),
      //         SizedBox(width: 20),
      //         TextController.mediumWhite("Sign In ").returnText(),
      //         SizedBox(width: 10),
      //       ],
      //     )
      //   ],
      // ),

      body: Column(
        children: [
          ContainerController.sizing(
                  maxHeight: 200,
                  maxWidth: double.infinity,
                  minHeight: 0,
                  minWidth: 0,
                  color: Colors.blue)
              .returnContainer(child: appBarRow())

          //@this is just for setting height and width and color to container .
        ],
      ),
    );
  }
}

Widget appBarRow() {
  return Row(
    children: [
      TextController.LargeWhite("AAYAM P.").returnText(),
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
  );
}
