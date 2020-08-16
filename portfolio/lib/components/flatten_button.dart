import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class FlattenButton extends StatefulWidget {
  Widget child;
  final Color color;
  final Function onPressed;

  FlattenButton({Key key, this.color = Cl.yellow, this.onPressed, this.child})
      : super(key: key);

  FlattenButton.text(
    String text, {
    this.color = Cl.yellow,
    this.onPressed,
  }) : assert(text != null) {
    this.child = FittedBox(

          child: Text(
        text,
        style: TextStyle(
            fontFamily: 'Roboto', fontSize: 17, color: Cl.dark, letterSpacing: 4),
      ),
    );
  }
  @override
  _FlattenButtonState createState() => _FlattenButtonState();
}

class _FlattenButtonState extends State<FlattenButton> {
  bool isPressed = false;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) {
        setState(() => isPressed = true);
      },
      onHighlightChanged: (bool) {
        setState(() {
          isPressed = bool;
        });
      },
      onTapCancel: () => setState(() => isPressed = false),
      onHover: (bool) {
        setState(() => isHovered = bool);
      },
      onTap: () {},
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOutExpo,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 36),
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Cl.primaryGray.withOpacity(isHovered ? 0.35 : 0.25),
                  offset: Offset((isHovered && !isPressed) ? 3 : 0,
                      (isHovered && !isPressed) ? 3 : 0),
                  blurRadius: isPressed ? 0 : (isHovered ? 20 : 10))
            ]),
        child: widget.child,
      ),
    );
  }
}
