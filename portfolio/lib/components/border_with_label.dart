import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class BorderWithLabel extends StatelessWidget {
  final String label;
  final Color borderColor;
  final Color color;
  final Color textColor;
  final Widget child;

  const BorderWithLabel(
      {Key key,
      this.label,
      this.borderColor = Cl.primaryGray,
      this.color = Cl.yellow,
      this.child, this.textColor = Cl.dark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor)),
            child: child),
        Positioned(
          top: -20,
          left: 80,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor),
                color: color),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
              child: Text(label,
                  style: TextStyle(
                      fontFamily: 'Roboto', fontSize: 18, color: textColor)),
            ),
          ),
        )
      ],
    );
  }
}
