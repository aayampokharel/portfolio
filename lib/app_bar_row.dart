import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:port/container_controller.dart';
import 'package:port/text_controller.dart';
import 'package:url_launcher/url_launcher.dart';

Future linkUrl(String str) async {
  final Uri url;

  url = Uri.parse(str);

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw "couldn't launch provided url . contact the website. ";
  }
}

Widget appBarRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // TextController.LargeWhite("  AAYAM P.").returnText(),
      // Image.asset(
      //   "Photos/myLogo.png",
      //   height: 50,
      // ),
      const LogoAnimation(),
      LayoutBuilder(builder: (context, constraints) {
        return Row(
          children: [
            AppBarHover(ContainerController.sizing(
                    maxHeight: 100, minHeight: 15, minWidth: 15, maxWidth: 100)
                .returnUrlContainer(
                    constraints.maxWidth > 600
                        ? Image.asset('Photos/github.png',
                            height: 80, width: 80)
                        : Image.asset('Photos/github.png',
                            height: 15, width: 15),
                    "http://github.com/aayampokharel")),
            const SizedBox(
              width: 1,
            ),
            AppBarHover(ContainerController.sizing(
                    maxHeight: 100, minHeight: 15, minWidth: 15, maxWidth: 100)
                .returnUrlContainer(
                    constraints.maxWidth > 600
                        ? Image.asset('Photos/instagram.png',
                            height: 100, width: 100)
                        : Image.asset('Photos/instagram.png',
                            height: 15, width: 15),
                    "http://instagram.com/pokharel_aayam")),

            // AppBarHover(TextController.mediumWhite("SIGN IN").returnText()),
          ],
        );
      }),
    ],
  );
}

class LogoAnimation extends StatelessWidget {
  const LogoAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 250, end: 0),
        duration: Duration(milliseconds: 1500),
        curve: Curves.bounceOut,
        builder: (builder, value, child) {
          return Transform.translate(
            offset: Offset(0, value),
            child: Image.asset(
              "Photos/myLogo.png",
              height: 50,
            ),
          );
        });
    // return Image.asset("Photos/myLogo.png", height: 50);
  }
}

class AppBarHover extends StatefulWidget {
  Widget appBarChild;
  AppBarHover(this.appBarChild);

  @override
  State<AppBarHover> createState() => _AppBarHoverState();
}

class _AppBarHoverState extends State<AppBarHover>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _tween;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _tween = Tween<double>(begin: 0, end: 75).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _tween,
        builder: (context, child) {
          return MouseRegion(
            onEnter: (event) {
              setState(() {
                _controller.forward();
              });
            },
            onExit: (event) {
              setState(() {
                _controller.reverse();
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(height: 2, width: _tween.value, color: Colors.white),
                widget.appBarChild,
                Container(height: 2, width: _tween.value, color: Colors.white),
              ],
            ),
          );
        });
  }
}
