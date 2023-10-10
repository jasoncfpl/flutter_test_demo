///@author: YangLang
///@version: v1.0
///@email: yanglang116@gmail.com
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContinueButton extends StatefulWidget {
  final Size size;
  final int maxTime; //单位：ms
  final int currentTime; //单位：ms

  const ContinueButton({
    Key? key,
    required this.size,
    required this.maxTime,
    required this.currentTime,
  })  : assert(currentTime >= 0),
        super(key: key);


  @override
  ContinueButtonState createState() => ContinueButtonState();
}

class ContinueButtonState extends State<ContinueButton> {

  //倒计时时长
  final int duration = 2000;
  ///声明变量
  Timer? _timer;


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        buildCenterWidget(),
        CustomPaint(
          size: widget.size,
          painter: ContinueButtonPainter(widget.maxTime, widget.currentTime),
        ),
      ],
    );
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
          ..strokeWidth = 4.w
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    painter.color = Colors.white;
    canvas.drawOval(rect, painter);
    painter.color = const Color(0xFFFF4B96);
    double progress = currentTime / maxTime;
    canvas.drawArc(rect, -pi / 2, progress * 2 * pi, false, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    ContinueButtonPainter oldPainter =
        oldDelegate as ContinueButtonPainter;
    return maxTime != oldDelegate.maxTime ||
        currentTime != oldPainter.currentTime;
  }
}
