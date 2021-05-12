import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    catAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    catAnimation = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: catAnimationController, curve: Curves.easeIn));

  }
   void onTap() {
    catAnimationController.forward();
    }
  @override
  void dispose() {
    catAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body:GestureDetector(
        child: buildAnimation(),
        onTap: onTap,
      ),
    );
  }

  Widget buildAnimation() {
    return AnimatedBuilder(
        animation: catAnimation, builder: (BuildContext context, Widget child) {
          return Container(
            child: child,
            margin: EdgeInsets.only(top: catAnimation.value),
          );
    },
        child: Cat()
    );
  }
}
