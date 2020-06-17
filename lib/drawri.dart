import 'package:flutter/material.dart';

class Drawri extends StatefulWidget {
  Drawri({Key key}) : super(key: key);

  @override
  _DrawriState createState() => _DrawriState();
}

class _DrawriState extends State<Drawri> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  @override
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();
  Widget build(BuildContext context) {
    var myDrawer = Container(color: Colors.black87);
    var myChild = Container(color: Colors.red);
    return GestureDetector(
      onTap: toggle,
      child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            double slidex = 245 * animationController.value;
            double slidey = 50 * animationController.value;
            double scale = 1 - (animationController.value * 0.1);
            double degree =
                0 - 15 * 3.1415927 / 180 * animationController.value;
            return Stack(
              children: <Widget>[
                myDrawer,
                Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(degree * 0.5)
                      ..rotateY(degree)
                      ..scale(scale)
                      ..translate(slidex, slidey),
                    alignment: Alignment.centerLeft,
                    child: myChild),
              ],
            );
          }),
    );
  }
}
