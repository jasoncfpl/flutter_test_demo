

import 'dart:developer';

import 'package:flutter_test_demo/page/room/live_room_interace.dart';

class RoomController extends ILiveRoom{

  int roomIndex;

  RoomController(this.roomIndex);

  @override
  initState() {
    log("RoomController initState $roomIndex");
  }

  @override
  onDispose() {
    log("RoomController onDispose $roomIndex");
  }


  enterRoom() {
    log("RoomController enterRoom $roomIndex");
  }



}