import 'dart:math';

import 'package:flutter/material.dart';

Widget rightFlap() {
  return Positioned(
    right: 2.0,
    child: Transform.rotate(
      child: Container(
        height: 10.0,
        width: 125.0,
        color: Colors.brown,
      ),
      angle: -pi * 0.6,
      alignment: Alignment.topRight,
    ),
  );
}
