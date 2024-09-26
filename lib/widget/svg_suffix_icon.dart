import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/dimensions.dart';


class SvgSuffixIcon extends StatelessWidget {

  const SvgSuffixIcon({super.key, required this.svgIcon});

  final String svgIcon;


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(
            Dimensions.paddingSizeLarge,
            Dimensions.paddingSizeSmall,
            Dimensions.paddingSizeSmall,
            Dimensions.paddingSizeSmall
        ),
      child: SvgPicture.asset(
          svgIcon,
          height: 20,
      ),
    );
  }

}