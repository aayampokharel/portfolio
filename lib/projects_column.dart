import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:port/container_controller.dart';
import 'package:port/list_of_repos.dart';
import 'package:port/repos_card_view.dart';

Widget projectColumn({bool odd = false}) {
  return Center(
    child: ContainerController.sizing(
      minWidth: 410,
      maxWidth: 520,
      color: Colors.transparent,
    ) //! to BE MERGED.
        .returnContainer(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: reposModelList.length,
          itemBuilder: (builder, ind) {
            if (ind % 2 != 0 && odd == true) {
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
            } else if (ind % 2 == 0 && odd == false) {
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
            }
            return const SizedBox(
              height: 150,
            );
          }),
    ),
  );
}
