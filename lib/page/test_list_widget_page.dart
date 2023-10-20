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
    for (int i = 0; i < 10; i++) {
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
      body:  Stack(
        children: list.map<Widget>((item) {
          int index = list.indexOf(item);
          return Positioned(
            left: index * 15,
              child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
            ));
          }).toList(),
        // children: [
        //   ...List.generate(
        //     5,
        //         (index) => Positioned(
        //       left: index * 15,
        //       child: Container(
        //         height: 30,
        //         width: 30,
        //         decoration: BoxDecoration(
        //           color: index.isEven ? Colors.black : Colors.grey,
        //           borderRadius: BorderRadius.circular(15),
        //         ),
        //       ),
        //     ),
        //   ),
        // ],
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