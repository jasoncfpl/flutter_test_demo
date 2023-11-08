import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestScrollPage extends StatefulWidget {

  const TestScrollPage({Key? key}) : super(key: key);

  @override
  TestScrollPageState createState() => TestScrollPageState();

}

class TestScrollPageState extends State<TestScrollPage> {

  ScrollController scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      log("listen:${scrollController.hashCode}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("TestScrollPageState"),
      ),
      body: Container(
        color: Colors.redAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Listener(
                child: Container(
                color: Colors.greenAccent,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Text("123"),
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "123",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        },
                      ),
                      SizedBox(width: 200,),
                      GestureDetector(
                        child: Text("456"),
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "456",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        },
                      ),
                      SizedBox(width: 200,),
                      GestureDetector(
                        child: Text("789"),
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "789",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
                onPointerDown: (event) {
                  log("event");
                },
              ),
              OutlinedButton(
                  onPressed: () {
                    start();
                  },
                  child: const Text("Start")),
            ],
          )
        ),
      ),
    );
  }

  start() {
    scrollController.jumpTo(0);
    scrollController.animateTo(200, duration: const Duration(seconds: 5), curve: Curves.easeIn);
  }

}
