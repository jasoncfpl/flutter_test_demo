///@author: YangLang
///@version: v1.0
///@email: yanglang116@gmail.com
import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContinueButton extends StatefulWidget {

  final Size size;
  const ContinueButton({Key? key, required this.size,}) :super(key: key);


  @override
  ContinueButtonState createState() => ContinueButtonState();
}

class ContinueButtonState extends State<ContinueButton> {

  //倒计时时长
  final int duration = 50000;
  ///声明变量
  Timer? _timer;
  //计时器
  int _counter = 0;

  bool isLongPressing = false;

  bool visible = true;

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
        visible = false;
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
    return Visibility(
        visible: visible,
        child: Stack(
      alignment: Alignment.center,
      children: [
        buildCenterWidget(),
        GestureDetector(
          onTap: () {
            _startTimer();
          },
          onTapUp: (_) {
            log("onTapUp");
            isLongPressing = false;
          },
          onTapCancel: () {
            log("onTapCancel");
            isLongPressing = false;
          },
          onLongPressStart: (detail) {
            log("onLongPressStart");
            isLongPressing = true;
            sendLoop();
          },
          onLongPressUp: () {
            log("onLongPressUp");
            isLongPressing = false;
          },
          onLongPressEnd: (detail) {
            log("onLongPressEnd");
            isLongPressing = false;
          },
          onLongPressCancel: () {
            log("onLongPressCancel");
            //触发一直连送，方便测试
            isLongPressing = false;
          },
          child: CustomPaint(
            size: widget.size,
            painter: ContinueButtonPainter(duration, _counter),
          ),
        )
      ],
    ),
    );
  }

  void sendLoop() async {
    log("sendLoop isLongPressing:$isLongPressing");
    if (!isLongPressing) return;
    if (!mounted) return;
    int time = DateTime.now().millisecondsSinceEpoch;
    //网络请求处理
    await Future.delayed(const Duration(milliseconds: 200));
    int cost = DateTime.now().millisecondsSinceEpoch - time;
    await Future.delayed(Duration(milliseconds: math.max(0, 200 - cost)), () {});
    _startTimer();
    sendLoop();
  }

  Widget buildCenterWidget() {
    return Container(
      width:  24.w,
      height:  24.w,
      color: Colors.red,
    );
  }

}

class ContinueButtonPainter extends CustomPainter {
  final int maxTime;
  final int currentTime;
  final Paint painter;

  ContinueButtonPainter(this.maxTime, this.currentTime)
      : painter = Paint()
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 4.w
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;

    painter.color = Colors.transparent;
    canvas.drawOval(rect, painter);

    painter.color = const Color(0xFFFF4B96);
    double progress = currentTime / maxTime;
    canvas.drawArc(rect, -math.pi / 2, progress * 2 * math.pi, true, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    ContinueButtonPainter oldPainter = oldDelegate as ContinueButtonPainter;
    return maxTime != oldDelegate.maxTime ||
        currentTime != oldPainter.currentTime;
  }
}
