import 'dart:async';

import 'package:flutter/material.dart';

class BackgroundClosePage extends StatefulWidget {

  final String? template;

  BackgroundClosePage(this.template);

  @override
  _BackgroundClosePageState createState() => _BackgroundClosePageState();
}

class _BackgroundClosePageState extends State<BackgroundClosePage> with
    WidgetsBindingObserver {

  Timer? timer;
  int count = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  start() {
    Future.delayed(const Duration(seconds: 3),() {
      print("TestLifecycle back");
      Navigator.pop(context);
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      print("TestLifecycle timer $count");
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TestLifecycle"),
      ),
      body: Column(
        children:  [
          const Text("TestLifecycle"),
          OutlinedButton(
              onPressed: () {
                start();
              },
              child: const Text("StartTimer")),
        ],
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {

      case AppLifecycleState.paused:
//      应用程序处于不可见状态
        print('TestLifecycle AppLifecycleState.paused');
        break;
      case AppLifecycleState.resumed:
      //    进入应用时候不会触发该状态
      //  应用程序处于可见状态，并且可以响应用户的输入事件。它相当于 Android 中Activity的onResume。
        print('TestLifecycle AppLifecycleState.resumed');
        break;
    }
  }

  @override
  void dispose() {
    print("TestLifecycle dispose $count");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    timer?.cancel();
  }
}
