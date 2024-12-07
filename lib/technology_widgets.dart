import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:port/container_controller.dart';
import 'package:port/list_of_repos.dart';
import 'package:port/text_controller.dart';

//@ this takes in technology used list from map for each repos card and accordingly returns the list of tech used for each repos in order .
//@ here we are actually adding the Widget form of the technology list as to serve directly as list of children for row in each card .

List<Widget> technologyWidgets(int i) {
  List<Widget> widgetsList = [];
  List<String> technologies = reposModelList[i].technologiesUsed!;
  for (String val in technologies) {
    widgetsList.add(Padding(
      padding: const EdgeInsets.all(5.0),
      child: ContainerController.button(
              buttonColor: const Color.fromARGB(255, 0, 149, 255))
          .returnButton(
              borderRadius: 80,
              borderColor: Colors.blue[600], //button color
              text: TextController.custom(val,
                      color: const Color.fromARGB(255, 242, 250, 255),
                      fontSize: 15)
                  .returnText(),
              fnctToRun: null),
    ));
  }
  return widgetsList;
}
