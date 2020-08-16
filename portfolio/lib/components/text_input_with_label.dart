import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class InputWithLabel extends StatefulWidget {
  final String label;
  final Color borderColor;
  final Color color;
  final Color textColor;
  final Function(String) onChanged;
  final String hintText;
  final bool isMultiline;
  final Function onTap;

  InputWithLabel({
    Key key,
    this.label,
    this.borderColor = Cl.smoke,
    this.color = Cl.yellow,
    this.textColor = Cl.dark,
    this.onChanged,
    this.hintText,
    this.isMultiline = false,
    this.onTap,
  }) : super(key: key);
  @override
  _InputWithLabelState createState() => _InputWithLabelState();
}

class _InputWithLabelState extends State<InputWithLabel> {
  FocusNode node = FocusNode();
  bool _isActive = false;

  @override
  void initState() {
    node.addListener(() {
      setState(() {
        _isActive = node.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: _isActive ? widget.color : widget.borderColor,
                    width: 2)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 6),
              child: TextField(
                focusNode: node,
                cursorColor: widget.color,
                maxLines: !widget.isMultiline ? 1 : 9,
                minLines: widget.isMultiline ? 5 : 1,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 17,
                    color: widget.textColor,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: widget.borderColor,
                        fontWeight: FontWeight.normal)),
              ),
            )),
        Positioned(
          top: -13,
          left: 35,
          child: Container(
            height: 26,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: _isActive ? widget.color : widget.borderColor,
                    width: 1.5),
                color: widget.color),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 2),
              child: Center(
                child: Text(widget.label?.toLowerCase(),
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: widget.textColor,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
