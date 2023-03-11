// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Tile {
  final int x;
  final int y;
  int val;

  late Animation<double> animatedX;
  late Animation<double> animatedY;
  late Animation<double> animatedValue;
  late Animation<double> scale;

  Tile(
    this.x,
    this.y,
    this.val,
  ) {
    resetAnimations();
  }

  void resetAnimations() {
    animatedX = AlwaysStoppedAnimation(x.toDouble());
    animatedX = AlwaysStoppedAnimation(y.toDouble());
    animatedValue = AlwaysStoppedAnimation(val as double);
    scale = const AlwaysStoppedAnimation(1.0);
  }
}
