import 'package:flutter/material.dart';

class FlexContainer extends StatelessWidget {
  final List<FlexColumnItem> items;
  final int columnsNumber;
  final bool wrap;
  final double width;

  FlexContainer(
      {this.items,
      this.columnsNumber = 2,
      this.wrap = false,
      this.width = double.infinity});

  _buildNoWrapContent(List<FlexColumnItem> widgets) {
    return Row(
      children: widgets,
    );
  }

  _buildWrapContent(List<FlexColumnItem> widgets) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widgets
          .map((e) => Padding(
                padding: e.wrappedPadding,
                child: e.child,
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: wrap ? _buildWrapContent(items) : _buildNoWrapContent(items),
    );
  }
}

class FlexLayoutBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, BoxConstraints constraints, bool wrap)
      builder;
  final double minNoWrapWidth;

  FlexLayoutBuilder({@required this.builder, this.minNoWrapWidth = 0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, _constraints) {
        return builder(context, _constraints,
            _constraints.maxWidth <= minNoWrapWidth);
      },
    );
  }
}

class FlexColumnItem extends StatelessWidget implements FlexItem {
  final int flex;
  final Widget child;

  final EdgeInsets wrappedPadding;

  FlexColumnItem(
      {this.flex = 1, this.child, this.wrappedPadding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: child,
    );
  }
}



mixin FlexItem {
  final int flex = 0;
  final Widget child = null;
}
