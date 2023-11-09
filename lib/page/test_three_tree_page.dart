import 'package:flutter/material.dart';

///
/// Flutter 三棵树测试
///
class TestThreeTreePage extends StatefulWidget {
  const TestThreeTreePage({Key? key}) : super(key: key);

  @override
  TestThreeTreePageState createState() => TestThreeTreePageState();
}

class TestThreeTreePageState extends State<TestThreeTreePage> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("TestThreeTreePage"),
        ),
        body: Container(color: Colors.red, child: Container(color: Colors.blue)));
  }
}
