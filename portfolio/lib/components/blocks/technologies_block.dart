import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/border_with_label.dart';
import 'package:portfolio/components/development_direction_item.dart';
import 'package:portfolio/components/flex_layout.dart';
import 'package:portfolio/components/page_block.dart';
import 'package:portfolio/components/techonology_item.dart';
import 'package:portfolio/constants/colors.dart';

class TechnologiesBlock extends StatelessWidget {
  final double blockHeight;
  final double minNoWrapWidth;
  final List<TechnologyItem> technologies;
  final List<DevelopmentDirectionItem> directions;
  final Color bgColor;
  final double titleHeight;
  final Widget title;

  const TechnologiesBlock(
      {Key key,
      this.blockHeight = 450,
      this.minNoWrapWidth = 600,
      this.technologies = const [],
      this.directions = const [],
      this.bgColor = Cl.white,
      this.title,
      this.titleHeight = 50})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Container(height: titleHeight, child: title)
            : SizedBox(),
        FlexiblePageBlock(
          blockHeight: (blockHeight - titleHeight) / directions.length,
          minNoWrapWidth: minNoWrapWidth,
          bgColor: bgColor,
          child: FlexLayoutBuilder(
              minNoWrapWidth: minNoWrapWidth,
              builder: (context, constraints, wrap) {
                return FlexContainer(
                  wrap: wrap,
                  columnsNumber: directions.length,
                  items: directions
                      .map((e) => FlexColumnItem(
                          flex: 1,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Animator(
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.easeOutQuad,
                                    tweenMap: {
                                      'opacity':
                                          Tween<double>(begin: 0, end: 1),
                                      'offset':
                                          Tween<double>(begin: -0.5, end: 0),
                                    },
                                    builder: (context, animation, child) {
                                      return Opacity(
                                        opacity: animation
                                            .getAnimation<double>('opacity')
                                            .value,
                                        child: Align(
                                            alignment: Alignment(
                                                animation
                                                    .getAnimation<double>(
                                                        'offset')
                                                    .value,
                                                0),
                                            child: child),
                                      );
                                    },
                                    child: Container(width: 280, child: e))
                              ])))
                      .toList(),
                );
              }),
        ),
        FlexiblePageBlock(
          blockHeight: (blockHeight - titleHeight) / 2,
          minNoWrapWidth: minNoWrapWidth,
          bgColor: bgColor,
          child: FlexLayoutBuilder(
              minNoWrapWidth: minNoWrapWidth,
              builder: (context, constraints, wrap) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Container(
                      child: BorderWithLabel(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: wrap
                                  ? Column(
                                      children: technologies
                                          .map((e) => FlexColumnItem(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Animator(
                                                        duration: Duration(
                                                            milliseconds: 2000),
                                                        curve:
                                                            Curves.easeOutQuad,
                                                        tweenMap: {
                                                          'opacity':
                                                              Tween<double>(
                                                                  begin: 0,
                                                                  end: 1),
                                                          'offset':
                                                              Tween<double>(
                                                                  begin: -2,
                                                                  end: 0),
                                                        },
                                                        builder: (context,
                                                            animation, child) {
                                                          return Opacity(
                                                            opacity: animation
                                                                .getAnimation<
                                                                        double>(
                                                                    'opacity')
                                                                .value,
                                                            child: Align(
                                                                alignment:
                                                                    Alignment(
                                                                  0,
                                                                  animation
                                                                      .getAnimation<
                                                                              double>(
                                                                          'offset')
                                                                      .value,
                                                                ),
                                                                child: child),
                                                          );
                                                        },
                                                        child:
                                                            Center(child: e)),
                                                  ],
                                                ),
                                              ))
                                          .toList())
                                  : FlexContainer(
                                      columnsNumber: 3,
                                      wrap: wrap,
                                      items: technologies
                                          .map((e) => FlexColumnItem(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Animator(
                                                        duration: Duration(
                                                            milliseconds: 2000),
                                                        curve:
                                                            Curves.easeOutQuad,
                                                        tweenMap: {
                                                          'opacity':
                                                              Tween<double>(
                                                                  begin: 0,
                                                                  end: 1),
                                                          'offset':
                                                              Tween<double>(
                                                                  begin: -2,
                                                                  end: 0),
                                                        },
                                                        builder: (context,
                                                            animation, child) {
                                                          return Opacity(
                                                            opacity: animation
                                                                .getAnimation<
                                                                        double>(
                                                                    'opacity')
                                                                .value,
                                                            child: Align(
                                                                alignment:
                                                                    Alignment(
                                                                  0,
                                                                  animation
                                                                      .getAnimation<
                                                                              double>(
                                                                          'offset')
                                                                      .value,
                                                                ),
                                                                child: child),
                                                          );
                                                        },
                                                        child: Center(child: e))
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                                    ),
                            ),
                          ),
                          label: "Front-End")),
                );
              }),
        ),
      ],
    );
  }
}
