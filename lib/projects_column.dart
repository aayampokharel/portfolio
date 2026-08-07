import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:port/container_controller.dart';
import 'package:port/list_of_repos.dart';
import 'package:port/repos_card_view.dart';

Widget projectColumn({bool odd = false}) {
  //@ projectColumn represents column of one seide. eehi chai arko ma check codition ma bolaincha , if odd then left if even or right , or something
  return Center(
    child: LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 450) {
        return ContainerController.sizing(
          minWidth: 410,
          maxWidth: 410,
          color: Colors.transparent,
        ) //! to BE MERGED.
            .returnContainer(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: reposModelList.length,
              itemBuilder: (builder, ind) {
                if (ind % 2 != 0 && odd) {
                  return ContainerController.sizing(
                    maxHeight: 1050,
                    maxWidth: 410,
                    minHeight: 200,
                    minWidth: 0,
                    //color: Color.fromARGB(255, 166, 8, 194),
                  ).returnCard(
                      childs: reposCard(
                        ind,
                      ),
                      colors: [
                        Color.fromARGB(143, 73, 255, 1),
                        Color.fromARGB(204, 17, 152, 255),
                      ]);
                } else if (ind % 2 == 0 && !odd) {
                  return ContainerController.sizing(
                    maxHeight: 1050,
                    maxWidth: 410,
                    minHeight: 200,
                    minWidth: 0,
                    //color: Color.fromARGB(255, 166, 8, 194),
                  ).returnCard(
                      childs: reposCard(
                        ind,
                      ),
                      colors: [
                        Color.fromRGBO(0, 255, 229, 0.8), // Start color
                        Color.fromARGB(204, 17, 152, 255),
                      ]);
                } else {
                  return const SizedBox(
                    height: 150,
                  );
                }
              }),
        );
      } else {
        return ContainerController.sizing(
          minWidth: 0,
          maxWidth: constraints.maxWidth,
          color: Colors.transparent,
        ) //! to BE MERGED.
            .returnContainer(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: reposModelList.length,
              itemBuilder: (builder, ind) {
                return ContainerController.sizing(
                  maxHeight: 1050,
                  maxWidth: constraints.maxWidth * 0.85,
                  minHeight: 200,
                  minWidth: 0,
                  //color: Color.fromARGB(255, 166, 8, 194),
                ).returnCard(
                    childs: reposCard(
                      ind,
                    ),
                    colors: [
                      Color.fromRGBO(0, 255, 229, 0.8), // Start color
                      Color.fromARGB(204, 17, 152, 255),
                    ]);
              }),
        );
      }
    }),
  );
}
