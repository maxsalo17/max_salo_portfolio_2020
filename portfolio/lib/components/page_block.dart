import 'package:flutter/material.dart';
import 'package:portfolio/components/flex_layout.dart';
import 'package:portfolio/constants/colors.dart';

class FlexiblePageBlock extends StatelessWidget {
  final double blockHeight;
  final double minNoWrapWidth;
  final int columnsNumber;
  final Color bgColor;
  final FlexLayoutBuilder child;
  final List<Widget> bgStackChildrenWidgets;
  const FlexiblePageBlock(
      {Key key,
      this.blockHeight,
      this.minNoWrapWidth,
      this.child,
      this.bgColor = Cl.dark,
      this.bgStackChildrenWidgets = const [], this.columnsNumber = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, _lconstraints) {
      return Container(
          height: _lconstraints.maxWidth > minNoWrapWidth
              ? blockHeight
              : blockHeight * columnsNumber,
          color: bgColor,
          child: Stack(
            overflow: Overflow.visible,
            children: [
            ...bgStackChildrenWidgets,
            Align(alignment: Alignment.center, child: child)
          ]));
    });
  }
}
