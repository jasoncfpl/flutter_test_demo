

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestRoomPage extends StatefulWidget {

  final int roomIndex;
  final String roomInfo;

  const TestRoomPage(this.roomIndex,this.roomInfo, {Key? key}) : super(key: key);

  @override
  TestRoomPageState createState() => TestRoomPageState();

}

class TestRoomPageState extends State<TestRoomPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).devicePixelRatio.w,
      height: 400,
      color: Colors.greenAccent,
      child: Column(
        children: [
          Text("RoomIndex:${widget.roomIndex}"),
          Text("RoomInfo:${widget.roomInfo}"),
        ],
      ),
    );
  }

}
