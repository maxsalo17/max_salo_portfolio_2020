import 'package:flutter/material.dart';
import 'package:portfolio/components/social_button.dart';
import 'package:portfolio/constants/colors.dart';

class SocialsBlock extends StatelessWidget {
  final Color color;
  final double size;
  const SocialsBlock({Key key, this.color = Cl.white, this.size = 24})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttons = [
      SocialButton(
        assetName: 'assets/icons/instagram.png',
        color: color,
        size: size,
      ),
      SocialButton(
        assetName: 'assets/icons/linkedin.png',
        color: color,
        size: size,
      ),
      SocialButton(
        assetName: 'assets/icons/git.png',
        color: color,
        size: size,
      ),
    ];

    return Row(
        mainAxisSize: MainAxisSize.min,
        children: buttons
            .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: e,
                ))
            .toList());
  }
}
