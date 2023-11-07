import 'package:flutter/physics.dart';
import 'package:flutter/cupertino.dart';

class DLCustomPageViewScrollPhysics extends ScrollPhysics {
  final double mass;
  final double stiffness;
  final double damping;
  const DLCustomPageViewScrollPhysics({ ScrollPhysics? parent,this.mass = 80,this.stiffness = 100,this.damping = 1})
      : super(parent: parent);

  @override
  DLCustomPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return DLCustomPageViewScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  SpringDescription get spring => const SpringDescription(
    mass: 80,
    stiffness: 100,
    damping: 1,
  );
}