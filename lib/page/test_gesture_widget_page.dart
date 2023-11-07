import 'package:flutter/material.dart';

///手势测试
class TestGestureDetectorPage extends StatefulWidget {
  const TestGestureDetectorPage({Key? key}) : super(key: key);

  @override
  TestGestureDetectorPageState createState() => TestGestureDetectorPageState();
}

class TestGestureDetectorPageState extends State<TestGestureDetectorPage> {
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
          title: const Text("TestGestureDetectorPage"),
        ),
        body: Center(
          child: Listener(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
                onTapDown: (details) {
                  print("GestureDetector点击事件");
                },

                child: Listener(
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.redAccent,
                    ),
                    onPointerDown: (event) {
                      print("内层点击事件");
                    },
                    onPointerMove: (event) {
                      // print("onPointerMove:  " + event.delta.toString());
                    },
                    onPointerUp: (event) {
                      // print("onPointerUp:  " + event.toString());
                    })),
            onPointerDown: (event) => print("外层点击事件"),
            onPointerMove: (event) => print("外层move事件"),
          ),
        ));
  }
}
