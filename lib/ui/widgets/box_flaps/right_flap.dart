import 'dart:math';

import 'package:flutter/material.dart';

Widget rightFlap(Animation boxAnimation) {
  return Positioned(
    right: 2.0,
    child: AnimatedBuilder(
      animation: boxAnimation,
      child: Container(
        height: 10.0,
        width: 125.0,
        color: Colors.brown,
      ),
      builder: (context, child) {
        return Transform.rotate(
          child: child,
          angle: -boxAnimation.value,
          alignment: Alignment.topRight,
        );
      },
    ),
  );

}
