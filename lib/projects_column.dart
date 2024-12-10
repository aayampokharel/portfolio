import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:port/container_controller.dart';
import 'package:port/list_of_repos.dart';
import 'package:port/repos_card_view.dart';

Widget projectColumn({bool odd = false, Color? color = Colors.transparent}) {
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
                maxHeight: 650,
                maxWidth: 410,
                minHeight: 200,
                minWidth: 0,
                //color: Color.fromARGB(255, 166, 8, 194),
                color: color,
              ).returnCard(
                  childs: reposCard(
                ind,
              ));
            } else if (ind % 2 == 0 && odd == false) {
              return ContainerController.sizing(
                maxHeight: 650,
                maxWidth: 410,
                minHeight: 200,
                minWidth: 0,
                //color: Color.fromARGB(255, 166, 8, 194),
                color: color,
              ).returnCard(
                  childs: reposCard(
                ind,
              ));
            }
            return const SizedBox(
              height: 150,
            );
          }),
    ),
  );
}
