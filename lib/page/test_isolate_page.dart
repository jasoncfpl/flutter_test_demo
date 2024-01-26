import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';

///代码清单 1-4
class IsolatePage extends StatefulWidget {

  const IsolatePage({Key? key}) : super(key: key);

  @override
  IsolatePageState createState() => IsolatePageState();
}

//lib/code/main_data.dart
class IsolatePageState extends State<IsolatePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IsolatePage"),
      ),
      backgroundColor: Colors.white,
      ///填充布局
      body: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              OutlinedButton(onPressed: startIsolate, child: const Text("Start Isolate")),
              OutlinedButton(onPressed: testAwiat, child: const Text("testAwiat")),
            ],
          )),
    );
  }

  Isolate? isolate;

  startIsolate() async {
    const String downloadLink = '下载链接';
    final resultPort = ReceivePort();
    isolate = await Isolate.spawn(readAndParseJson, [resultPort.sendPort, downloadLink]);

    resultPort.listen((message) {
      print('Data：$message');
      resultPort.close();// 关闭管道

      isolate?.kill(priority: Isolate.immediate);// 杀死并发 Isolate
      isolate = null;
    });

    // // 等待 Isolate 回传管道
    // final fileContent = await resultPort.first as String;
    // print('展示文件内容: $fileContent');

  }

  //设置 延迟2秒 来模拟文件读取。
  static Future<void> readAndParseJson(List<dynamic> args) async {
    SendPort sendPort = args[0];
    String fileLink = args[1];

    print('获取下载链接: $fileLink');

    String fileContent = '文件内容content';
    await Future.delayed(const Duration(seconds: 2));
    sendPort.send(fileContent);
  }

  testAwiat() {
    Future(() => print('f1'))
        .then((_) => Future(() => print('f2')))
        .then((_) => print('f3'));
    print('f4-before');
    Future(() => print('f4'));
    print('f5');

    print('start');
    test1();
    print('1 after');
    test2();
    print('2 after');
  }

  test1() async{
    print('11111---');
    await Future.delayed(const Duration(seconds: 2));
    print('11111===');
  }

  test2() async{
    print('22222---');
    await Future.delayed(const Duration(seconds: 2));
    print('22222===');
  }
}