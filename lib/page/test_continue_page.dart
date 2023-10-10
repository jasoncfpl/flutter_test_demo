import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_demo/animation_widget/circular_continue_button.dart';
import 'package:flutter_test_demo/animation_widget/continue_button.dart';

class ContinuePage extends StatefulWidget {

  const ContinuePage({Key? key}) : super(key: key);

  @override
  ContinuePageState createState() => ContinuePageState();

}

class ContinuePageState extends State<ContinuePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("ContinuePage"),
      ),
      body: Center(
        child: Column(
          children: const [
            CircleContinueButton(),
            SizedBox(height: 20,),
            ContinueButton(
              size: Size(72, 72),
              maxTime: 15 * 1000,
              currentTime: 2,
            ),
          ],
        )
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