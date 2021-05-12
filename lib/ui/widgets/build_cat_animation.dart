import 'package:flutter/material.dart';
import 'package:flutter_animation/ui/widgets/cat.dart';

Widget buildCatAnimation(Animation catAnimation) {
  return AnimatedBuilder(
      animation: catAnimation,
      builder: (BuildContext context, Widget child) {
        return Positioned(
          child: child,
          top: catAnimation.value,
          right: 0.0,
          left: 0.0,
        );
      },
      child: Cat()
  );
}