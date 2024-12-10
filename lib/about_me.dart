import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:port/container_controller.dart';
import 'package:port/text_controller.dart';

Widget AboutMe() {
  return ContainerController.sizing(
    maxHeight: 500,
    maxWidth: double.infinity,
    minHeight: 0,
    minWidth: 0,
    color: Color(0xff0A3446),
  ).returnContainer(
    img: "Photos/mountain.jpg",
    opacity: 0.7,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "Photos/quotation.png",
                  height: 50,
                  width: 50,
                ),
                TextController.custom(
                        " I’m a passionate and detail-oriented full-stack developer with a will for building intuitive and engaging applications. My journey in technology has been fueled by a drive to create seamless user experiences.\nI’m skilled in Flutter for crafting cross-platform apps and Go,MySQL for backend development, leveraging modern practices like WebSockets and dependency injection to ensure scalability and performance. ",
                        color: Colors.white,
                        fontSize: 25)
                    .returnText(fontFamily: "Opensans"),
                Transform.flip(
                  flipX: true,
                  flipY: true,
                  child: Image.asset(
                    "Photos/quotation.png",
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            ),
          ),
          ClipOval(
            child: Transform.scale(
              scale: 1,
              child: Container(
                height: 360,
                width: 360,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(8), // Padding for border effect
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6), // Shadow color
                          spreadRadius: 6, // Spread radius
                          blurRadius: 15, // Blur radius
                          offset: Offset(0, 8), // Shadow offset
                        ),
                      ],
                    ),
                    child: SizedBox(
                      height: 500,
                      width: 500,
                      child: ClipOval(
                        child: Image.asset(
                          "Photos/me.jpeg",
                          width: 750,
                          height: 750,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
