import 'dart:developer';

import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatefulWidget {

  const TweenAnimationBuilderPage({Key? key}) : super(key: key);

  @override
  TweenAnimationBuilderPageState createState() => TweenAnimationBuilderPageState();

}

class TweenAnimationBuilderPageState extends State<TweenAnimationBuilderPage> with TickerProviderStateMixin{

  AnimationController? _animationController;

  Animation<double>? pushAnimation;


  @override
  void initState() {
    super.initState();
    //方式2
    _animationController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);

    pushAnimation = Tween(begin: -100.0, end: 50.0).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.ease),
    );

    _animationController?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        log("动画完成");
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
        title: const Text("TweenAnimationBuilderPage"),
      ),
      body: AnimatedBuilder(
        animation: pushAnimation!,
        builder: (BuildContext context, Widget? child) {
          log("AnimatedBuilder builder pushAnimation:${pushAnimation!.value}");
          if (_animationController?.value == 0) {
            return Container();
          }
          return Transform(
              transform: Matrix4.translationValues(pushAnimation!.value, 0.0, 0.0),
              child: child);

        },
        child: Stack(
          children: [
            Container(
              color: Colors.green,
              width: 100,
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _start,
        tooltip: 'start',
        child: const Icon(Icons.add),
      ), // This
    );
  }

  _start() {
    _animationController?.reset();
    _animationController?.forward();
  }

}

