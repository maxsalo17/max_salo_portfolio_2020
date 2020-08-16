import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/nav_button.dart';
import 'package:portfolio/constants/colors.dart';

class EndDrawer extends StatelessWidget {
  final double expandedWidth;
  final List<NavButton> navigation;
  final Widget leading;
  final Widget trailing;
  final Function onClose;
  final Color bgColor;

  const EndDrawer(
      {Key key,
      this.expandedWidth,
      this.navigation,
      this.leading,
      this.trailing,
      this.onClose,
      this.bgColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _nav = navigation
        .map((e) => Padding(
              padding: EdgeInsets.all(8),
              child: Container(width: 100, child: e),
            ))
        .toList();
    return Container(
      width: expandedWidth,
      color: bgColor,
      child: Column(children: [
        Container(
          alignment: Alignment.centerLeft,
            child: Padding(
          padding: const EdgeInsets.all(64.0),
          child: InkWell(
            child: Icon(Icons.close, color: Cl.dark),
            onTap: onClose ??
                () {
                  Navigator.pop(context);
                },
          ),
        )),
        Expanded(
          child: Column(),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0),
            child: LiveList(
              showItemInterval: Duration(milliseconds: 50),
              showItemDuration: Duration(milliseconds: 200),
              reAnimateOnVisibility: true,
              itemCount: _nav.length,
              itemBuilder: (context, index, animation) {
                return FadeTransition(
                  opacity: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: Tween<double>(
                      begin: 0,
                      end: 1,
                    ).animate(animation),
                    child: _nav[index],
                  ),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Column(),
        )
      ]),
    );
  }
}
