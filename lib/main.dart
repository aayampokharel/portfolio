import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:port/about_me.dart';
import 'package:port/app_bar_row.dart';
import 'package:port/container_controller.dart';
import 'package:port/hello_widget.dart';
import 'package:port/projects_column.dart';
import 'package:port/svg_links_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:port/text_controller.dart';
import 'dart:math';

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

//! not working for mobile phones for mobile hello widget needs
//! be convertd to mediumwhite text or custom one as the text is too large to fit for MOBILE phones .
class home extends StatelessWidget {
  @override

//   Navbar Background	#0A3446	Strong and stable, anchors the design at the top.
// Main Background	#E5E5E5	Light, neutral tone ensures content stands out.
// Headings (Text)	#0A3446	Keeps headings bold and readable.
// Body Text	#2D5C73	Softer contrast for a cohesive yet readable look.
// Primary Buttons	#36B2B8	Bright and attention-grabbing for actions.
// Hover States	#FFC857	Adds vibrancy and warmth to interactive elements.
// Card Backgrounds	#FFFFFF or #2D5C73	Clean, subtle, and allows content to shine.
// Icons/Highlights	#FFC857	Adds a cheerful, noticeable touch without overwhelming.
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0f4c5c),
      // backgroundColor: Color(0xff0D1F23),
      // backgroundColor: Color(0xff1F4A53),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              ContainerController.sizing(
                maxHeight: 500,
                maxWidth: double.infinity,
                minHeight: 500,
                minWidth: 0,
              ).returnContainer(
                img: "Photos/amayangri.jpg",
                opacity: 0.7,
                child: null,
              ),
              HelloWidget(context),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ContainerController.sizing(
                        maxHeight: 400,
                        maxWidth: double.infinity,
                        minHeight: 80,
                        minWidth: 0,
                        color: Color(0xFF0A3446).withOpacity(0.7))
                    .returnContainer(child: appBarRow()),
              ),
            ],
          ),

          //@this is just for setting height and width and color to container .tara appbar row sets the spacing and row to display inside the container

          //~aba aaucha Hello container ========
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: TextController.LargeWhite("ABOUT ME").returnText(),
          ),
          Center(
            child: Container(
              height: 3,
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.white38,
            ),
          ),
          const SizedBox(height: 10),
          AboutMe(),

          //~aba aaucha projects collection container ========
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: TextController.LargeWhite("PROJECTS").returnText(),
          ),
          Center(
            child: Container(
              height: 3,
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.white38,
            ),
          ),
          //~=====end of text project===
          //~
          //~
          //~
          Container(
            color: Colors
                .transparent, //! this is to be same colored with card ko surrounding color .
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Column(children: [
                    //@ dont use such hard values . use soft calculate for 300 using query . 300 is a fraction of whole height or container height so make it in fraction

                    projectColumn(odd: true, color: Colors.blue[400]),
                  ]),
                ),
                Flexible(
                  child: Column(children: [
                    projectColumn(odd: false, color: Colors.brown[400]),
                  ]),
                ),
              ],
            ),
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
    return Container(
      // color: Color(0xff0A3446), //! changed .....
      color: Colors.transparent, //! changed .....
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(child: assetSvg(img1)),
            Expanded(child: assetSvg(img2)),
            Expanded(child: assetSvg(img3)),
            Expanded(child: assetSvg(img4)),
          ],
        ),
      ),
    );
  }
}

Widget assetSvg(String? string) {
  if (string == null) {
    return SizedBox(height: 0, width: 0);
  }

  //! if not null --> below.
  return Container(
    color: Colors.transparent,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: LayoutBuilder(builder: (context, constraints) {
        return SVGAnimation(string);
      }),
    ),
  );
}

class SVGAnimation extends StatefulWidget {
  String string;

  SVGAnimation(this.string);

  @override
  State<SVGAnimation> createState() => _SVGAnimationState();
}

class _SVGAnimationState extends State<SVGAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _tween;
  bool hover = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _tween = Tween<double?>(begin: 0, end: 10).animate(_controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _tween,
        builder: (context, child) {
          return MouseRegion(
            onEnter: ((event) {
              hover = true;

              _controller.forward();
            }),
            onExit: ((event) {
              _controller.reverse();
            }),
            child: Stack(
              alignment: Alignment.center, // Centers content within the Stack
              clipBehavior: Clip.none,
              children: [
                ContainerController.sizing(
                        maxHeight: 150,
                        minHeight: 30,
                        maxWidth: 150,
                        minWidth: 30,
                        color: Colors.blueAccent.withOpacity(0.2))
                    .returnContainer(child: null, borderRadius: 15.0),
                Positioned(
                  top: (_tween.value == 0) ? null : _tween.value,
                  left: (_tween.value == 0) ? null : _tween.value,
                  child: Transform.rotate(
                    angle: pi / 20, // Rotate by 45 degrees
                    child: Container(
                      height: 100,
                      width: 100,
                      child: SvgPicture.asset(
                        widget.string,
                        semanticsLabel: "semanticText",
                        // height: 100, // Control logo size
                        // width: 100, // Control logo size
                        placeholderBuilder: (BuildContext context) => Container(
                          padding: const EdgeInsets.all(30.0),
                          child: const CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
