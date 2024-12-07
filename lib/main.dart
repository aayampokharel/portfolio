import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:port/app_bar_row.dart';

import 'package:port/container_controller.dart';
import 'package:port/hello_widget.dart';
import 'package:port/list_of_repos.dart';
import 'package:port/repos_card_view.dart';
import 'package:port/text_controller.dart';

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

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(children: [
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

          //@this is just for setting height and width and color to container .tara appbar row sets the spacing and row to display inside the container

          //~aba aaucha Hello container ========
          ContainerController.sizing(
                  maxHeight: 400,
                  maxWidth: double.infinity,
                  minHeight: 0,
                  minWidth: 0,
                  color: Colors.orange)
              .returnContainer(
                  child: HelloWidget()), //shows hello hola namaste like ios
          //~aba aaucha projects collection container ========

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextController.LargeWhite("PROJECTS").returnText(),
          ),
          ContainerController.sizing(
                  maxHeight: 400,
                  minHeight: 0,
                  maxWidth: MediaQuery.of(context).size.width * 0.90,
                  minWidth: 0,
                  color: Colors.black87)
              .returnContainer(
            child: ListView.builder(
                itemCount: reposModelList.length,
                itemBuilder: (builder, ind) {
                  return ContainerController.sizing(
                          maxHeight: 550,
                          maxWidth: double.infinity,
                          minHeight: 200,
                          minWidth: 0,
                          color: Colors.transparent)
                      .returnCard(child: reposCard(ind));
                }),
          ),
        ]),
      ),
    );
  }
}
