import 'package:flutter/material.dart';
import 'package:portfolio/components/blocks/socials_block.dart';
import 'package:portfolio/components/flex_layout.dart';
import 'package:portfolio/components/page_block.dart';
import 'package:portfolio/constants/colors.dart';

class AboutMe extends StatelessWidget {
  final double blockHeight;
  final double minNoWrapWidth;

  const AboutMe({Key key, this.blockHeight = 450, this.minNoWrapWidth = 600})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexiblePageBlock(
      blockHeight: blockHeight,
      minNoWrapWidth: 600,
      columnsNumber: 2,
      bgStackChildrenWidgets: [
        Center(
          child: SizedBox(
            width: 530,
            height: 440,
            child: Image.asset('assets/images/me.png'),
          ),
        ),
        Align(alignment: Alignment.bottomLeft, child: SocialsBlock())
      ],
      child: FlexLayoutBuilder(
          minNoWrapWidth: minNoWrapWidth,
          builder: (context, constraints, wrap) {
            return FlexContainer(
              wrap: wrap,
              items: [
                FlexColumnItem(
                  flex: 2,
                  child: Container(
                    height: blockHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hi there, I`m",
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Cl.primaryGray,
                              height: 1),
                        ),
                        Text(
                          "Max Salo.",
                          style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              color: Cl.white,
                              height: 1),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            color: Cl.yellow,
                            width: 64,
                            height: 8,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                FlexColumnItem(
                  flex: 1,
                  child: Container(
                    width: 350,
                    height: blockHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "- About me",
                          style: TextStyle(fontSize: 16, color: Cl.primaryGray),
                        ),
                        Text(
                          "Web and mobile developer, based in Kyiv, Ukraine.",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: Cl.white,
                          ),
                        ),
                        SizedBox(height: 60),
                        Text(
                          "If you have a cool or ingenious idea, contact me and together we will quickly and efficiently implement it.",
                          style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 18,
                              color: Cl.primaryGray),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
