import 'dart:developer';

import 'package:flutter/material.dart';

class EasyAnimatePage extends StatefulWidget {

  const EasyAnimatePage({Key? key}) : super(key: key);

  @override
  EasyAnimatePageState createState() => EasyAnimatePageState();

}

class EasyAnimatePageState extends State<EasyAnimatePage> with TickerProviderStateMixin{

  AnimationController? _animationController;

  double _marginTop = 0;

  @override
  void initState() {
    super.initState();

    //方式1  默认value为 0.0 - 1.0
    // _animationController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this)..addListener(() {
    //   setState(() {
    //     _marginTop = (_animationController?.value ?? 0) * 50.0;
    //   });
    // });

    //方式2
    _animationController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this,lowerBound: 0,upperBound: 100)
      ..addListener(() {
        setState(() {
          _marginTop = _animationController?.value ?? 0;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController?.reverse();
        }
      });
  }


  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("TestListWidgetPage"),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: _marginTop),
            color: Colors.red,
            width: 100,
            height: 100,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _start,
        tooltip: 'start',
        child: const Icon(Icons.add),
      ), // This
    );
  }

  _start() {
    _animationController?.forward();
  }

}

