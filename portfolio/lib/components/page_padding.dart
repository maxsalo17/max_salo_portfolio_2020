import 'package:flutter/material.dart';

class PagePadding extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;

  PagePadding({this.padding = EdgeInsets.zero, this.child}):assert(child!=null);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Padding(
        padding: padding,
        child: Container(
          child: child,
        ),
      ),
    );
  }
}