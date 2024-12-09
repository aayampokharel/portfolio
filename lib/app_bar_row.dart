import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:port/text_controller.dart';

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
      Row(
        children: [
          AppBarHover(TextController.mediumWhite("HOME").returnText()),
          const SizedBox(
            width: 20,
          ),
          AppBarHover(TextController.mediumWhite("ABOUT").returnText()),
          const SizedBox(
            width: 20,
          ),
          AppBarHover(TextController.mediumWhite("SIGN IN").returnText()),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
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
