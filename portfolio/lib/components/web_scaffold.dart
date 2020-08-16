import 'package:flutter/material.dart';
import 'package:portfolio/components/flex_layout.dart';
import 'package:portfolio/components/page_padding.dart';
import 'package:portfolio/constants/colors.dart';

class PageScaffold extends StatelessWidget {
  final Widget logo;
  final Widget title;
  final List<Widget> navigation;
  final double headerHeight;
  final Color bgColor;
  final Widget body;
  final Widget modal;
  final Alignment modalPosition;
  final EdgeInsets padding;
  final bool showAppbar;

  PageScaffold(
      {this.logo = const SizedBox(),
      this.title = const SizedBox(),
      this.navigation = const [],
      this.body = const SizedBox(),
      this.headerHeight = 60,
      this.bgColor = Cl.dark,
      this.modal = const SizedBox(),
      this.modalPosition = Alignment.center,
      this.showAppbar = true,
      this.padding = EdgeInsets.zero});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: PagePadding(
        padding: padding,
        child: Stack(children: [
          Column(
            children: [
              showAppbar
                  ? Container(
                      height: headerHeight,
                      width: double.infinity,
                      child: FlexLayoutBuilder(
                        builder: (context, width, wrap) {
                          return FlexContainer(wrap: wrap, items: [
                            FlexColumnItem(
                              child: Align(
                                  alignment: Alignment.centerLeft, child: logo),
                              flex: 2,
                            ),
                            FlexColumnItem(
                              child: Column(
                                crossAxisAlignment: navigation.length == 1
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: navigation
                                        .map((e) => Padding(
                                              padding: EdgeInsets.all(8),
                                              child: e,
                                            ))
                                        .toList(),
                                  ),
                                ],
                              ),
                              flex: 1,
                            )
                          ]);
                        },
                      ),
                    )
                  : SizedBox(),
              body
            ],
          ),
        ]),
      ),
    );
  }
}
