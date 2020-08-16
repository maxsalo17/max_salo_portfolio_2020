import 'package:flutter/material.dart';
import 'package:portfolio/components/development_direction_item.dart';
import 'package:portfolio/constants/colors.dart';

class TechnologyItem extends StatelessWidget {
  final Widget image;
  final String technology;
  final String expierenence;
  final ItemStyle style;

  const TechnologyItem(
      {Key key,
      this.image,
      this.technology,
      this.expierenence,
      this.style = const ItemStyle(
          textColor: Cl.primaryGray,
          subtitleColor: Cl.dark,
          titleColor: Cl.primaryGray)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(height: 60, child: image),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(technology,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: style.titleColor)),
            Text(expierenence,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w100,
                    color: style.subtitleColor)),
          ],
        ),
      ],
    );
  }
}
