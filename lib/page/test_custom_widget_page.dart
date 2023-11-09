import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

///
/// 自定义widget
///
class TestCustomWidgetPage extends StatefulWidget {
  const TestCustomWidgetPage({Key? key}) : super(key: key);

  @override
  TestCustomWidgetPageState createState() => TestCustomWidgetPageState();
}

class TestCustomWidgetPageState extends State<TestCustomWidgetPage> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    log("TestCustomWidgetPage build width:${MediaQuery.of(context).size.width}==height:${MediaQuery.of(context).size.height}");
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("TestCustomWidgetPage"),
        ),
        body: Container(
          color: Colors.yellowAccent,
          child: Container(
            color: Colors.red,
            width: 200,
            height: 300,
            child: Center(
              child: CustomPaint(
                painter: MyCustomPainter(),
              ),
            )
          ),
        )
    );
  }
}


class MyCustomPainter extends CustomPainter {

  Paint myPaint = Paint()
    ..color = Colors.blueAccent // 画笔颜色
    ..strokeCap = StrokeCap.round // 画笔笔触类型
    ..isAntiAlias = true // 是否启动抗锯齿
    ..style = PaintingStyle.stroke // 绘画风格，默认为填充
    ..filterQuality = FilterQuality.high // 颜色渲染模式的质量
    ..strokeWidth = 2.0;

  @override
  void paint(Canvas canvas, Size size) {
    log("paint width:${size.width}==height:${size.height}");


    myPaint.shader = ui.Gradient.linear(Offset(20, 0), Offset(size.width, 0), [Color(0xFF93F249), Color(0xFF0BB682)]);
    Rect rectCircle1 = Rect.fromCircle(center: Offset(size.width / 2.0, size.height / 2.0), radius: 40.0);
    Rect rectCircle2 = Rect.fromCircle(center: Offset(size.width / 2.0, size.height / 2.0), radius: 40.0);
    // 根据上面的矩形,构建一个圆角矩形
    RRect rrect1 = RRect.fromRectAndRadius(rectCircle1, const Radius.circular(30.0));
    RRect rrect2 = RRect.fromRectAndRadius(rectCircle2, const Radius.circular(30.0));

    canvas.drawRRect(rrect1, myPaint);
    // canvas.saveLayer(rectCircle1, myPaint);
    // canvas.restore();
    // myPaint.blendMode = BlendMode.clear;
    myPaint..style = PaintingStyle.fill;
    // myPaint.color = const Color(0x1AFFEA00);
    myPaint.shader = ui.Gradient.linear(Offset(20, 0), Offset(size.width, 0), [Color(0x6693F249), Color(0xFF0BB682)]);
    canvas.drawRRect(rrect2, myPaint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}