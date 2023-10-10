import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_demo/animation_widget/continue_button.dart';

class ContinuePage extends StatefulWidget {

  const ContinuePage({Key? key}) : super(key: key);

  @override
  ContinuePageState createState() => ContinuePageState();

}

class ContinuePageState extends State<ContinuePage> {


  int get maxRecordTime => 15 * 1000;

  int get minRecordTime => 10 * 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("ContinuePage"),
      ),
      body: Column(
        children:  [
          ContinueButton(
            size: Size(72.w, 72.w),
            tip: "提示",
            maxTime: maxRecordTime,
            currentTime: 10,
          )
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