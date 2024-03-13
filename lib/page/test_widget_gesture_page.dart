import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_demo/animation_widget/circular_continue_button.dart';
import 'package:flutter_test_demo/animation_widget/continue_button.dart';

import 'gesture/multiple_tap_gesture_recognizer.dart';

class TestWidgetGesturePage extends StatefulWidget {

  const TestWidgetGesturePage({Key? key}) : super(key: key);

  @override
  TestWidgetGesturePageState createState() => TestWidgetGesturePageState();

}

class TestWidgetGesturePageState extends State<TestWidgetGesturePage> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          log("onWillPop");
          Navigator.of(context).pop();
          return Future.value(false);
        },
        child: Material(
      child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const Text("GesturePageState"),
          ),
          body: RawGestureDetector(// 自己构造父 Widget 的手势识别映射关系
            gestures: {
              // 建立多手势识别器与手势识别工厂类的映射关系，从而返回可以响应该手势的 recognizer
              MultipleTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<
                  MultipleTapGestureRecognizer>(
                    () => MultipleTapGestureRecognizer(),
                    (MultipleTapGestureRecognizer instance) {
                  instance.onTap = () => print('parent tapped ');// 点击回调
                },
              )
            },
            child: Container(
              color: Colors.pinkAccent,
              child: Center(
                child: GestureDetector(// 子视图可以继续使用 GestureDetector
                  onTap: () => print('Child tapped'),
                  child: Container(
                    color: Colors.blueAccent,
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
              ),
            ),
          )
      ),
    ),
    );
  }

}


class GroupWidget extends StatefulWidget {

  final Color color;

  const GroupWidget(this.color, {Key? key}) : super(key: key);

  @override
  GroupWidgetState createState() => GroupWidgetState();

}

class GroupWidgetState extends State<GroupWidget> {

  @override
  Widget build(BuildContext context) {
    log("GroupWidget build");
    return  Container(
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(5),
      color: widget.color,
      //1.当使用 const的时候，父布局的重建不会回调子widget的didUpdateWidget
      //2.当不使用 const的时候，父布局的重建会回调子widget的didUpdateWidget
      child:  const ChildWidget(),
    );
  }

  @override
  void initState() {
    log("GroupWidget initState");
    super.initState();
  }


  @override
  void didChangeDependencies() {
    log("GroupWidget didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(GroupWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    log("GroupWidget didUpdateWidget");
  }

  @override
  void deactivate() {
    log("GroupWidget deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    log("GroupWidget dispose");
    super.dispose();
  }
}

class ChildWidget extends StatefulWidget {

  const ChildWidget({Key? key}) : super(key: key);

  @override
  ChildWidgetState createState() => ChildWidgetState();

}

class ChildWidgetState extends State<ChildWidget> {

  @override
  Widget build(BuildContext context) {
    log("ChildWidget build");
    return  Container(
      width: 100,
      height: 100,
      color: Colors.green,
    );
  }

  @override
  void initState() {
    log("ChildWidget initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    log("ChildWidget didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(ChildWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    log("ChildWidget didUpdateWidget");
  }

  @override
  void deactivate() {
    log("ChildWidget deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    log("ChildWidget dispose");
    super.dispose();
  }
}