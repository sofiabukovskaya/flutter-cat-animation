import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animation/ui/widgets/box_flaps/left_flap.dart';
import 'package:flutter_animation/ui/widgets/box_flaps/right_flap.dart';
import 'package:flutter_animation/ui/widgets/build_cat_animation.dart';
import 'package:flutter_animation/ui/widgets/build_box.dart';
import 'package:flutter_animation/ui/widgets/cat.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catAnimationController;
  Animation<double> boxAnimation;
  AnimationController boxAnimationController;

  @override
  void initState() {
    super.initState();

    boxAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    boxAnimation = Tween(begin: pi*0.6, end: pi * 0.65).animate(
        CurvedAnimation(parent: boxAnimationController, curve: Curves.easeIn));
    boxAnimation.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        boxAnimationController.reverse();
      } else if(status == AnimationStatus.dismissed) {
        boxAnimationController.forward();
      }
     });
    boxAnimationController.forward();

    catAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    catAnimation = Tween(begin: -40.0, end: -83.0).animate(
        CurvedAnimation(parent: catAnimationController, curve: Curves.easeIn));

  }

  void onTap() {

    if (catAnimationController.status == AnimationStatus.completed) {
      boxAnimationController.forward();
      catAnimationController.reverse();
    } else if (catAnimationController.status == AnimationStatus.dismissed) {
      boxAnimationController.stop();
      catAnimationController.forward();
    }
  }

  @override
  void dispose() {
    catAnimationController.dispose();
    boxAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text(
          'Animation',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        backgroundColor: Colors.orangeAccent[100],
        centerTitle: true,
      ),
      body: GestureDetector(
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              buildCatAnimation(catAnimation),
              buildBox(),
              leftFlap(boxAnimation),
              rightFlap(boxAnimation)
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
