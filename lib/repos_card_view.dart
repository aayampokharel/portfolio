import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:port/container_controller.dart';
import 'package:port/list_of_repos.dart';
import 'package:port/technology_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:port/text_controller.dart';

Future openURL(int i) async {
  final Uri url = Uri.parse(reposModelList[i].githubLink ?? "");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw "couldn't launch provided url . contact the website. ";
  }
}

//@ this is the simple card structure for repos .
/// ORDER: Image , technology , description , github link .
///
Widget reposCard(int index, {double? containerWidth}) {
  ///can remove containerWidth this was just usde or UI setting up width.
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("${reposModelList[index].imgURL}", height: 200),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: technologyWidgets(index),
      ),
      Flexible(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextController.smallBlack(reposModelList[index].description!)
              .returnText(justify: true),
        ),
      ),
      Center(
        child: ContainerController.button(buttonColor: Colors.blue[700])
            .returnButton(
                text: TextController.mediumWhite("GitHub").returnText(),
                fnctToRun: openURL,
                indexOfReposInList: index,
                padding: 20,
                borderRadius: 20,
                borderColor: Colors.blue[900]),
      ),
    ],
  );
}
