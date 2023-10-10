///@author: YangLang
///@version: v1.0
///@email: yanglang116@gmail.com
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContinueButton extends StatelessWidget {
  final Size size;
  final String tip;
  final int maxTime; //单位：ms
  final int currentTime; //单位：ms

  const ContinueButton({
    Key? key,
    required this.size,
    required this.tip,
    required this.maxTime,
    required this.currentTime,
  })  : assert(currentTime >= 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            buildCenterWidget(),
            CustomPaint(
              size: size,
              painter: ContinueButtonPainter(maxTime, currentTime),
            ),
          ],
        ),
        SizedBox(height: 8.w),
        buildBottomInfo(),
      ],
    );
  }

  Widget buildCenterWidget() {
    return Container(
      width: currentTime == 0 ? size.width : 24.w,
      height: currentTime == 0 ? size.height : 24.w,
      color: Colors.red,
    );
  }

  Widget buildBottomInfo() {
    if (currentTime <= 0) {
      return Text(
        tip,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.w,
        ),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6.w,
          height: 6.w,
          decoration: BoxDecoration(
            color: const Color(0xFFFF506D),
            borderRadius: BorderRadius.circular(3.w),
          ),
        ),
        SizedBox(width: 3.w),
        Text(
          formatTime(currentTime),
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.w,
          ),
        ),
      ],
    );
  }

  String formatTime(int currentTime) {
    int secondTime = currentTime ~/ 1000;
    int minus = secondTime ~/ 60;
    int second = secondTime % 60;
    return '$minus:${second.toString().padLeft(2, '0')}';
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
