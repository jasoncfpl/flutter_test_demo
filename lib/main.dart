import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_demo/dl_dropdown_button.dart';
import 'package:flutter_test_demo/page/animation_page/test_animation_page.dart';
import 'package:flutter_test_demo/page/test_continue_page.dart';
import 'package:flutter_test_demo/page/test_custom_widget_page.dart';
import 'package:flutter_test_demo/page/test_gesture_widget_page.dart';
import 'package:flutter_test_demo/page/test_gradient_circlular_progress_route.dart';
import 'package:flutter_test_demo/page/test_background_close_page.dart';
import 'package:flutter_test_demo/page/test_isolate_page.dart';
import 'package:flutter_test_demo/page/test_list_widget_page.dart';
import 'package:flutter_test_demo/page/test_loop_page.dart';
import 'package:flutter_test_demo/page/test_page_view_page.dart';
import 'package:flutter_test_demo/page/test_scroll_page.dart';
import 'package:flutter_test_demo/page/test_three_tree_page.dart';
import 'package:flutter_test_demo/page/test_visiable_page.dart';
import 'package:flutter_test_demo/page/test_widget_lifecycle_page.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () {
        return GetMaterialApp(
          title: 'Flutter Demo',
          locale: Get.locale,
          supportedLocales: const [
            Locale.fromSubtags(languageCode: 'en'),
            Locale.fromSubtags(languageCode: 'zh'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  RxInt dropdownValue = 1.obs;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

    String cvNew = "DLABROAD3.2.82_Android";
    int cv1Index = cvNew.indexOf("_");
    log("cv1Index : $cv1Index");
    if (cv1Index >= 0) {
      cvNew = cvNew.substring(0, cv1Index);
    }
    log("cvNew1 : $cvNew");
    RegExp rgx = RegExp(r"\d+");
    List<String?> ver1Arr = rgx.allMatches(cvNew).map((m) => m.group(0)).toList();
    log("ver1Arr : $ver1Arr");

    int ver1 = calVersionValue(ver1Arr);
    log("ver1 : $ver1");
  }

  int calVersionValue(List<String?> cvArr) {
    int verValue = 0;
    int coe = 1;
    for (int i = cvArr.length - 1; i >= 0; i--) {
      int ver = int.tryParse(cvArr[i] ?? "0") ?? 0;
      verValue += ver * coe;
      coe *= 100;
    }
    return verValue;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //横轴三个子widget
                childAspectRatio: 1.0 //宽高比为1时，子widget
            ),
            children:<Widget>[
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const TestVisiblePage(),
                    ));
                  },
                  child: const Text("Visible Page")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const ContinuePage(),
                    ));
                  },
                  child: const Text("ContinuePage")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const FutureLoopTestPage(),
                    ));
                  },
                  child: const Text("FutureLoopTestPage")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const GradientCircularProgressRoute(),
                    ));
                  },
                  child: const Text("GradientCircularProgressRoute")),
              DLDropdownButton(
                dropdownColor: const Color(0xFF281E32),
                items: <int>[1, 2, 3, 4].map<DLDropdownMenuItem<int>>((int value) {
                  return DLDropdownMenuItem<int>(
                    value: value,
                    child: Text(
                      "$value",
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                underline: const SizedBox.shrink(),
                icon: const SizedBox(),
                value: dropdownValue.value,
                alwaysTop: true,
                hint: Container(
                  color: Colors.red,
                ),
                disabledHint: Container(
                  color: Colors.green,
                ),
                marginTop: 40,
                onChanged: (newValue) {
                  dropdownValue.value = newValue as int;
                },
                child: Container(
                  color: Colors.blue,
                  child: Text(
                    "${dropdownValue.value}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const TestListWidgetPage(),
                    ));
                  },
                  child: const Text("TestListWidgetPage")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const TestAnimatePage(),
                    ));
                  },
                  child: const Text("TestAnimatePage")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const TestGestureDetectorPage(),
                    ));
                  },
                  child: const Text("TestGestureDetectorPage")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const TestPageViewPage(),
                    ));
                  },
                  child: const Text("TestPageViewPage")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const TestScrollPage(),
                    ));
                  },
                  child: const Text("TestScrollPage")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const TestThreeTreePage(),
                    ));
                  },
                  child: const Text("TestThreeTreePage")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const TestCustomWidgetPage(),
                    ));
                  },
                  child: const Text("TestCustomWidgetPage")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => BackgroundClosePage("123"),
                    ));
                  },
                  child: const Text("TestLifecycle")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const IsolatePage(),
                    ));
                  },
                  child: const Text("TestIsolate")),

              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const TestWidgetLifecyclePage(),
                    ));
                  },
                  child: const Text("TestWidgetLifecyclePage")),

            ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    super.initState();
    log("MyHomePage initState:$hashCode==${Get.locale}");
  }

  @override
  void dispose() {
    super.dispose();
    log("MyHomePage dispose:$hashCode");
  }


}
