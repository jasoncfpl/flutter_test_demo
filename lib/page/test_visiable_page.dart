import 'dart:developer';

import 'package:flutter/material.dart';

class TestVisiblePage extends StatefulWidget {

  const TestVisiblePage({Key? key}) : super(key: key);

  @override
  TestVisiblePageState createState() => TestVisiblePageState();

}

class TestVisiblePageState extends State<TestVisiblePage> {

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("TestVisiblePage"),
      ),
      body: Column(
        children:  [
          Visibility(
              visible: visible,
              child: const VisibleWidget()
          ),
          OutlinedButton(
              onPressed: () {
                visible = !visible;
                setState(() {

                });
              },
              child: const Text("Visible Page")),
        ],
      ),
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