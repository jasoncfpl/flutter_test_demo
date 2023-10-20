import 'dart:developer';

import 'package:flutter/material.dart';

class TweenAnimatePage extends StatefulWidget {

  const TweenAnimatePage({Key? key}) : super(key: key);

  @override
  TweenAnimatePageState createState() => TweenAnimatePageState();

}

class TweenAnimatePageState extends State<TweenAnimatePage> with TickerProviderStateMixin{

  AnimationController? _animationController;

  Animation<double>? _animation;

  Animation<Color?>? _colorAnimation;


  @override
  void initState() {
    super.initState();


    //方式2
    _animationController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    _animation = Tween(begin: 0.0, end: 50.0).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.ease),
    );
    _animation?.addListener(() {
      setState(() {});
    });

    _colorAnimation = ColorTween(begin: Colors.orangeAccent, end: Colors.redAccent).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.ease),
    )..addListener(() {
      setState(() {});
    });

    _animationController?.addStatusListener((status) {
      if (status == AnimationStatus.completed) log("动画完成");
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
        title: const Text("TweenAnimatePage"),
      ),
      body: Material(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: _animation?.value ?? 0),
              color: _colorAnimation?.value ?? Colors.green,
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
    _animationController?.forward();
  }

}

