import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class DevelopmentDirectionItem extends StatelessWidget {
  final Widget image;
  final String title;
  final String subtitle;
  final String text;
  final ItemStyle style;

  const DevelopmentDirectionItem(
      {Key key,
      this.image,
      this.title,
      this.subtitle,
      this.text,
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
          child: SizedBox(height: 85, child: image),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: style.titleColor)),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 9,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w100,
                  color: style.subtitleColor)),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color: style.textColor)),
        )
      ],
    );
  }
}

class ItemStyle {
  final Color titleColor;
  final Color subtitleColor;
  final Color textColor;

  const ItemStyle({this.titleColor, this.subtitleColor, this.textColor});
}
