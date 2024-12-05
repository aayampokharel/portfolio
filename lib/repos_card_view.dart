import 'package:flutter/cupertino.dart';
import 'package:port/list_of_repos.dart';
import 'package:port/technology_widgets.dart';

import 'package:port/text_controller.dart';

Widget reposCard(int index) {
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
