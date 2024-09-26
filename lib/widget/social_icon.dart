import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/styles.dart';


class SocialIcon extends StatelessWidget {

  const SocialIcon({super.key, this.icon, this.text, this.press});

  final String? icon;
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    /*return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(40),
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon!),
      ),
    );*/
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0XFFE5E7EB)), // Border color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Button padding
      ),
      onPressed: () {
        press as void Function();
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon!),
          const SizedBox(width: 10),
          Text(
            text!,
            style: interMediumBlack,
          ),
        ],
      ),
    );
  }

}