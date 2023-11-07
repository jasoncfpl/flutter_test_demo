import 'dart:developer';

import 'package:flutter/material.dart';

class TestListWidgetPage extends StatefulWidget {

  const TestListWidgetPage({Key? key}) : super(key: key);

  @override
  TestListWidgetPageState createState() => TestListWidgetPageState();

}

class TestListWidgetPageState extends State<TestListWidgetPage> {

  List<String> list = [];


  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 2; i++) {
      list.add("Test$i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("TestListWidgetPage"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 40,
              color: Colors.redAccent,
              child: Stack(
                fit: StackFit.loose,
                children: list.map<Widget>((item) {
                  int index = list.indexOf(item);
                  Color color = Colors.black;
                  if (index % 2 == 1) {
                    color = Colors.grey;
                  }
                    return Padding(
                      padding: EdgeInsets.only(left: index * 15),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    );
                    // return Positioned(
                  //     left: index * 15,
                  //     width: 30,
                  //     child: Container(
                  //       height: 30,
                  //       width: 30,
                  //       decoration: BoxDecoration(
                  //         color: Colors.black,
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //     ));
                }).toList(),
              ),
            )
          ],
        ),
      )
    );
  }

}


class VisibleWidget extends StatefulWidget {

  const VisibleWidget({Key? key}) : super(key: key);

  @override
  VisibleWidgetState createState() => VisibleWidgetState();

}



class VisibleWidgetState extends State<VisibleWidget> {


  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 200,
      height: 200,
      color: Colors.red,
    );
  }

  @override
  void initState() {
    log("VisibleWidgetState initState");
    super.initState();
  }

  @override
  void dispose() {
    log("VisibleWidgetState dispose");
    super.dispose();
  }
}