import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    catAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    catAnimation = Tween(begin: -40.0, end: -83.0).animate(
        CurvedAnimation(parent: catAnimationController, curve: Curves.easeIn));
  }

  void onTap() {
    if (catAnimationController.status == AnimationStatus.completed) {
      catAnimationController.reverse();
    } else if (catAnimationController.status == AnimationStatus.dismissed) {
      catAnimationController.forward();
    }
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
        title: const Text('Animation', style: TextStyle(fontWeight:  FontWeight.bold, color: Colors.black54),),
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
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
