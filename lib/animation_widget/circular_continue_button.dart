

import 'dart:async';

import 'package:flutter/material.dart';

class CircleContinueButton extends StatefulWidget {

  final Function? onContinueSend;

  const CircleContinueButton({super.key, this.onContinueSend});

  @override
  CircleContinueButtonState createState() => CircleContinueButtonState();
}


class CircleContinueButtonState extends State<CircleContinueButton> {
  //倒计时时长
  final int duration = 2000;
  ///声明变量
  Timer? _timer;

  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }


  @override
  void dispose() {
    super.dispose();
    _stopTimer();
  }

  void _startTimer() {
    _stopTimer();
    ///循环执行
    ///间隔1秒
    _counter = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      ///自增
      _counter += 50;
      ///到5秒后停止
      if (_counter >= duration) {
        _timer?.cancel();
      }
      if (mounted) {
        setState(() {});
      }

    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await widget.onContinueSend?.call();
        _startTimer();
      },
      child: CircularProgressIndicator(
        ///当前指示的进度 0.0 -1.0
        value: _counter / duration,
      ),
    );
  }

}