import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class SocialButton extends StatelessWidget {
  final double size;
  final String assetName;
  final Function onPressed;
  final Color color;
  SocialButton({this.size = 24, this.assetName, this.onPressed, this.color = Cl.white});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child:
          Container(width: size, height: size, child: Image.asset(assetName, color: color,)),
    );
  }
}
