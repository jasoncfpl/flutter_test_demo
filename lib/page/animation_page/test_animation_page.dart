import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test_demo/page/animation_page/easy_animation_page.dart';

class TestAnimatePage extends StatefulWidget {

  const TestAnimatePage({Key? key}) : super(key: key);

  @override
  TestAnimatePageState createState() => TestAnimatePageState();

}

class TestAnimatePageState extends State<TestAnimatePage> {

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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("TestListWidgetPage"),
      ),
      body: Column(
        children: [
          OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const EasyAnimatePage(),
                ));
              },
              child: const Text("EasyAnimatePage"))
        ],
      ),
    );
  }


}

