import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class NavButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final Color activeColor;
  final Color inactioveColor;
  final Function onPressed;

  NavButton(
      {this.text,
      this.isActive = false,
      this.onPressed,
      this.activeColor = Cl.white,
      this.inactioveColor = Cl.primaryGray});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed ?? () {},
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(text,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: isActive ? activeColor : inactioveColor)),
                
              ],
            ),
            isActive
                ? Positioned(
                    bottom: -1,
                    right: -4,
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Cl.yellow, shape: BoxShape.circle),
                    ),
                  )
                : SizedBox()
          ],
        ));
  }
}
