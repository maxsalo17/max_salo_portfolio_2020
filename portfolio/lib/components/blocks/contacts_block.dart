import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/blocks/socials_block.dart';
import 'package:portfolio/components/border_with_label.dart';
import 'package:portfolio/components/development_direction_item.dart';
import 'package:portfolio/components/flatten_button.dart';
import 'package:portfolio/components/flex_layout.dart';
import 'package:portfolio/components/page_block.dart';
import 'package:portfolio/components/techonology_item.dart';
import 'package:portfolio/components/text_input_with_label.dart';
import 'package:portfolio/constants/colors.dart';

class ContactsBlock extends StatelessWidget {
  final double blockHeight;
  final double minNoWrapWidth;

  const ContactsBlock(
      {Key key, this.blockHeight = 450, this.minNoWrapWidth = 600})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final inputs = [
      InputWithLabel(
        label: 'Name',
        hintText: 'Enter your name',
      ),
      InputWithLabel(label: 'Email', hintText: 'Enter your email'),
      InputWithLabel(
        label: 'Message',
        hintText: 'How can I help you?',
        isMultiline: true,
      )
    ];

    final headerItems = [
      Text(
        "Get ",
        style: TextStyle(
            color: Cl.dark,
            fontSize: 26,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold),
      ),
      Text(
        "in touch",
        style: TextStyle(
            color: Cl.dark,
            fontSize: 24,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w200),
      ),
    ];

    return Column(
      children: [
        FlexiblePageBlock(
          blockHeight: blockHeight,
          columnsNumber: 1,
          minNoWrapWidth: minNoWrapWidth,
          bgColor: Cl.white,
          bgStackChildrenWidgets: [
            Positioned(
              top: 50,
              right: -200,
              child: Animator(
                duration: Duration(milliseconds: 4000),
                curve: Curves.easeInOut,
                repeats: 10000,
                tween: Tween<double>(begin: -0.2, end: 0.2),
                builder: (c, an, ch) {
                  return Transform.rotate(
                    angle: an.value*an.value,
                    child: ch);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: SizedBox(
                      height: 67,
                      child: Image.asset('assets/images/elements/post.png')),
                ),
              ),
            ),
            Animator(
              duration: Duration(milliseconds: 1500),
              curve: Curves.easeOutQuart,
              tween: Tween<double>(begin: -100, end: 0),
              builder: (c, an, ch) {
                return Positioned(bottom: -37, right: an.value, child: ch);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: SizedBox(
                    height: 254,
                    child: Image.asset('assets/images/elements/worker.png')),
              ),
            )
          ],
          child: FlexLayoutBuilder(
              minNoWrapWidth: minNoWrapWidth,
              builder: (context, constraints, wrap) {
                return FlexContainer(
                  wrap: false,
                  columnsNumber: 1,
                  items: [
                    FlexColumnItem(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.end,
                              children: headerItems,
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 45.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: List<Widget>.generate(
                                            inputs.length,
                                            (index) => Animator(
                                                  duration: Duration(
                                                      milliseconds: 1000 +
                                                          (index * 1000)),
                                                  curve: Curves.easeOutQuart,
                                                  tween: Tween<double>(
                                                      begin: 0, end: 1),
                                                  builder: (c, an, ch) {
                                                    return Opacity(
                                                        opacity: an.value,
                                                        child: ch);
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 24.0),
                                                    child: Container(
                                                        constraints:
                                                            BoxConstraints(
                                                                minWidth: 100,
                                                                maxWidth: 500),
                                                        child: inputs[index]),
                                                  ),
                                                ))),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Cl.white,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        alignment: WrapAlignment.center,
                                        children: [
                                          FlattenButton.text(
                                            'Submit',
                                          ),
                                          SizedBox(width: 64),
                                          FittedBox(
                                            child: SocialsBlock(
                                              color: Cl.dark,
                                              size: 19,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
