import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:port/container_controller.dart';
import 'package:port/list_of_repos.dart';
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
      body: SingleChildScrollView(
        child: Column(children: [
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

          //~aba aaucha Hello container ========
          ContainerController.sizing(
                  maxHeight: 400,
                  maxWidth: double.infinity,
                  minHeight: 0,
                  minWidth: 0,
                  color: Colors.orange)
              .returnContainer(
                  child: HelloWidget()), //shows hello hola namaste like ios
          //~aba aaucha projects collection container ========
          TextController.LargeWhite("PROJECTS").returnText(),
          Container(
            height: 400,
            child: ListView.builder(
                itemCount: reposModelList.length,
                itemBuilder: (builder, ind) {
                  return ContainerController.sizing(
                          maxHeight: 550,
                          maxWidth: double.infinity,
                          minHeight: 200,
                          minWidth: 0,
                          color: Colors.transparent)
                      .returnCard(child: reposCard(ind));
                }),
          ),
        ]),
      ),
    );
  }
}

Widget reposCard(int index) {
  return Column(
    children: [
      //ddContainerController.sizing()
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("${reposModelList[index].imgURL}", height: 200),
      ),
      // ListView.builder(
      //     itemCount: reposModelList.length,
      //     scrollDirection: Axis.horizontal,
      //     itemBuilder: (context, ind) {
      //       var lenOfTechnologyUsed = reposModelList[ind].technologiesUsed!;
      //       for (String val in lenOfTechnologyUsed) {
      //         return ContainerController.button(buttonColor: Colors.blue[200])
      //             .returnButton(
      //                 borderRadius: 80,
      //                 borderColor: Colors.blue[600],
      //                 text: TextController.custom(val,
      //                         color: Colors.black, fontSize: 15)
      //                     .returnText(),
      //                 fnctToRun: null);
      //       }
      //     }),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: technologyWidgets(index),
      ),

      ///this below is for flutter,go,mysql buttons.

      //  ],
      Flexible(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextController.smallBlack(reposModelList[index].description!)
              .returnText(justify: true),
        ),
      ),
    ],
  );
}

List<Widget> technologyWidgets(int i) {
  List<Widget> widgetsList = [];
  List<String> technologies = reposModelList[i].technologiesUsed!;
  for (String val in technologies) {
    widgetsList.add(Padding(
      padding: const EdgeInsets.all(5.0),
      child:
          ContainerController.button(
                  buttonColor: Color.fromARGB(255, 0, 149, 255))
              .returnButton(
                  borderRadius: 80,
                  borderColor: Colors.blue[600],
                  text: TextController.custom(val,
                          color: Color.fromARGB(255, 242, 250, 255),
                          fontSize: 15)
                      .returnText(),
                  fnctToRun: null),
    ));
  }
  return widgetsList;
}

// Widget reposWidgetList() {
//   return Text(child:)
// }

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
      TextController.mediumWhite("A flutter & Go developer ,").returnText(),
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
