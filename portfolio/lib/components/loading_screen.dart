import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/constants/colors.dart';

class LoadingScreen extends StatefulWidget {
  final Size size;
  final Function onLoad;

  const LoadingScreen({Key key, this.size, this.onLoad}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && widget.onLoad != null) {
        widget.onLoad();
      }
    });
    Future.delayed(Duration(seconds: 2), () {
      _controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: widget.size.height,
      color: Cl.dark,
      // child: Lottie.asset(
      //   'assets/lottie/logo.json',
      //   controller: _controller,
      //   alignment: Alignment.center,
      // ),
      child:
      Image.asset('assets/images/elements/logo.gif', filterQuality: FilterQuality.high),
    );
  }
}
