import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: ContainerController.sizing(
                    maxHeight: 200,
                    maxWidth: double.infinity,
                    minHeight: 0,
                    minWidth: 0,
                    color: Colors.blue)
                .returnContainer(child: appBarRow()),
          ),

          //@this is just for setting height and width and color to container .tara appbar row sets the spacing and row to display inside the container

          //~aba aaucha second container========
          ContainerController.sizing(
                  maxHeight: 400,
                  maxWidth: double.infinity,
                  minHeight: 0,
                  minWidth: 0,
                  color: Colors.orange)
              .returnContainer(
                  child: HelloWidget()), //shows hello hola namaste like ios
        ],
      ),
    );
  }
}

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

Widget HelloWidget() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextController.LargeWhite("Hello,  ")
                .returnText(), //@this is to be changed into namaste, hola , other languages .

            Flexible(
                child: TextController.LargeWhite("I am Aayam Pokharel,")
                    .returnText()),
          ],
        ),
      ),
      TextController.mediumWhite("A flutter & Go developer ,").returnText(),
      SizedBox(
        height: 20,
      ),
      ContainerController.button(buttonColor: Colors.green).returnButton(
          text: TextController.mediumWhite("review").returnText(),
          fnctToRun: null,
          padding: 15,
          borderRadius: 10,
          borderColor: Colors.black45)
    ],
  );
}
