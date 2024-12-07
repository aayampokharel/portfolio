import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:port/app_bar_row.dart';

import 'package:port/container_controller.dart';
import 'package:port/hello_widget.dart';

import 'package:port/projects_column.dart';
import 'package:port/svg_links_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:port/text_controller.dart';
import 'dart:math'; //for pi

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

//! not working for mobile phones for mobile hello widget needs to
class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            //alignment: Alignment.ce,
            children: [
              ContainerController.sizing(
                maxHeight: 500,
                maxWidth: double.infinity,
                minHeight: 0,
                minWidth: 0,
              ).returnContainer(img: "Photos/me4.jpeg", child: null),
              HelloWidget(context),
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
            ],
          ),

          //@this is just for setting height and width and color to container .tara appbar row sets the spacing and row to display inside the container

          //~aba aaucha Hello container ========
          // ContainerController.sizing(
          //   maxHeight: 400,
          //   maxWidth: double.infinity,
          //   minHeight: 0,
          //   minWidth: 0,
          // ).returnContainer(
          //     img: "Photos/me4.jpeg",
          //     child: HelloWidget()), //shows hello hola namaste like ios
          //~aba aaucha projects collection container ========
          TextController.LargeWhite("PROJECTS").returnText(),
          //~=====end of text project===
          //~
          //~
          //~
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Column(children: [
                  SizedBox(
                    height:
                        300, //@ dont use such hard values . use soft calculate for 300 using query . 300 is a fraction of whole height or container height so make it in fraction
                  ),
                  projectColumn(odd: true, color: Colors.blue[400]),
                ]),
              ),
              Flexible(
                child: Column(children: [
                  projectColumn(odd: false, color: Colors.purple[300]),
                ]),
              ),
            ],
          ),
          //~end of PROJECTS===
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 15),
            child:
                TextController.LargeWhite("Technologies & Tools").returnText(),
          ),
          Center(
            child: Container(
              height: 3,
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.white38,
            ),
          ),
          languageLogosRow(
            img1: svgLinksMap["dart"],
            img2: svgLinksMap["flutter"],
            img3: svgLinksMap["golang"],
            img4: svgLinksMap["mysql"],
          ),
          languageLogosRow(
            img2: svgLinksMap["git"],
            img1: svgLinksMap["github"],
            img3: svgLinksMap["postman"],
            img4: svgLinksMap["c"],
          ),

          languageLogosRow(
            img1: svgLinksMap["cpp"],
            img2: svgLinksMap["vscode"],
            img3: svgLinksMap["androidstudio"],
            img4: svgLinksMap["html"],
          ),
          languageLogosRow(
              img1: svgLinksMap["css"],
              img2: svgLinksMap["javascript"],
              img3: svgLinksMap["php"],
              img4: svgLinksMap["photoshop"]),
          languageLogosRow(
            img1: svgLinksMap["adobexd"],
            img2: svgLinksMap["adobeillustrator"],
          ),
        ]),
      ),
    );
  }

  Widget languageLogosRow(
      {String? img1, String? img2, String? img3, String? img4}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(child: assetSvg(img1)),
          Expanded(child: assetSvg(img2)),
          Expanded(child: assetSvg(img3)),
          Expanded(child: assetSvg(img4)),
        ],
      ),
    );
  }
}

Widget assetSvg(String? string) {
  if (string == null) {
    return SizedBox(height: 0, width: 0);
  }

  //! if not null --> below.
  return Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: 10.0), // Adjusts spacing between logos
    child: LayoutBuilder(builder: (context, constraints) {
      return Stack(
        alignment: Alignment.center, // Centers content within the Stack
        children: [
          ContainerController.sizing(
                  maxHeight: 200,
                  minHeight: 50,
                  maxWidth: 200,
                  minWidth: 50,
                  color: Colors.blueAccent.withOpacity(0.2))
              .returnContainer(child: null, borderRadius: 15.0),

          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.blueAccent
          //         .withOpacity(0.2), // Background color for the container
          //     borderRadius: BorderRadius.circular(15), // Rounded corners

          //   ),
          //   height: 100, // Adjust height to fit logos nicely
          //   width: 100, // Adjust width for proper fitting
          // ),
          // Rotated logo inside the container
          Transform.rotate(
            angle: pi / 20, // Rotate by 45 degrees
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                string,
                semanticsLabel: "semanticText",
                height: 150, // Control logo size
                width: 150, // Control logo size
                placeholderBuilder: (BuildContext context) => Container(
                  padding: const EdgeInsets.all(30.0),
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ],
      );
    }),
  );
}
