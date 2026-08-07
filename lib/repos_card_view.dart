import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:port/container_controller.dart';
import 'package:port/list_of_repos.dart';
import 'package:port/technology_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:port/text_controller.dart';

Future openURL(int i) async {
  final Uri url;

  url = Uri.parse(reposModelList[i].githubLink ?? "");

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw "couldn't launch provided url . contact the website. ";
  }
}

Future youtubeURL(int i) async {
  final Uri url;

  url = Uri.parse(reposModelList[i].youtubeLink ?? "");

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw "couldn't launch provided url . contact the website. ";
  }
}

Future liveURL(int i) async {
  final Uri url;

  url = Uri.parse(reposModelList[i].liveLink ?? "");

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw "couldn't launch provided url . contact the website. ";
  }
}

//@ this is the simple card structure for repos .
/// ORDER: Image , technology , description , github link .
///
Widget reposCard(int index) {
  ///can remove containerWidth this was just usde or UI setting up width.
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 880) {
        return Column(
          children: [
            TextController.LargeWhite(reposModelList[index].topic!)
                .returnText(),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    ContainerController.sizing(maxHeight: 500, minHeight: 200)
                        .returnContainer(
                  child: Image.asset("${reposModelList[index].imgURL}",
                      height: 500, fit: BoxFit.contain),
                )),
            Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 4,
              children: technologyWidgets(index),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextController.custom(
                        reposModelList[index].description!,
                        color: const Color(0xFFC8DCE2),
                        fontSize: 16)
                    .returnText(justify: true),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (reposModelList[index].githubLink != null)
                    ContainerController.button(buttonColor: Colors.blue[700])
                        .returnButton(
                            text:
                                TextController.mediumWhite("GitHub").returnText(),
                            fnctToRun: openURL,
                            indexOfReposInList: index,
                            padding: 20,
                            borderRadius: 20,
                            borderColor: Colors.blue[900]),
                  if (reposModelList[index].githubLink != null)
                    const SizedBox(width: 10),
                  if (reposModelList[index].youtubeLink != null)
                    ContainerController.button(buttonColor: Colors.red[700])
                        .returnButton(
                            text:
                                TextController.mediumWhite("Youtube Video")
                                    .returnText(),
                            fnctToRun: youtubeURL,
                            indexOfReposInList: index,
                            padding: 20,
                            borderRadius: 20,
                            borderColor: Colors.red[900]),
                  if (reposModelList[index].youtubeLink != null)
                    const SizedBox(width: 10),
                  if (reposModelList[index].liveLink != null)
                    ContainerController.button(
                            buttonColor: const Color(0xff36B2B8))
                        .returnButton(
                            text: TextController.mediumWhite("View Live")
                                .returnText(),
                            fnctToRun: liveURL,
                            indexOfReposInList: index,
                            padding: 20,
                            borderRadius: 20,
                            borderColor: const Color(0xff0A3446)),
                ],
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            TextController.mediumWhite(reposModelList[index].topic!)
                .returnText(),
            Padding(
                padding: const EdgeInsets.all(4.0),
                child:
                    ContainerController.sizing(maxHeight: 400, minHeight: 200)
                        .returnContainer(
                  child: Image.asset("${reposModelList[index].imgURL}",
                      height: 400, fit: BoxFit.contain),
                )),
            Wrap(
              alignment: WrapAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: technologyWidgets(index),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextController.custom(
                        reposModelList[index].description!,
                        color: const Color(0xFFC0DCE2),
                        fontSize: 15)
                    .returnText(justify: true),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (reposModelList[index].githubLink != null)
                    ContainerController.button(buttonColor: Colors.blue[700])
                        .returnButton(
                            text: TextController.custom("GitHub",
                                    color: Colors.white, fontSize: 16)
                                .returnText(),
                            fnctToRun: openURL,
                            indexOfReposInList: index,
                            padding: 20,
                            borderRadius: 20,
                            borderColor: Colors.blue[900]),
                  if (reposModelList[index].githubLink != null)
                    const SizedBox(width: 10),
                  if (reposModelList[index].youtubeLink != null)
                    ContainerController.button(buttonColor: Colors.red[700])
                        .returnButton(
                            text: TextController.custom("Youtube Link",
                                    color: Colors.white, fontSize: 16)
                                .returnText(),
                            fnctToRun: youtubeURL,
                            indexOfReposInList: index,
                            padding: 20,
                            borderRadius: 20,
                            borderColor: Colors.red[900]),
                  if (reposModelList[index].youtubeLink != null)
                    const SizedBox(width: 10),
                  if (reposModelList[index].liveLink != null)
                    ContainerController.button(
                            buttonColor: const Color(0xff36B2B8))
                        .returnButton(
                            text: TextController.custom("View Live",
                                    color: Colors.white, fontSize: 16)
                                .returnText(),
                            fnctToRun: liveURL,
                            indexOfReposInList: index,
                            padding: 20,
                            borderRadius: 20,
                            borderColor: const Color(0xff0A3446)),
                ],
              ),
            ),
          ],
        );
      }
    }),
  );
}
