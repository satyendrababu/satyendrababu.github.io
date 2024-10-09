import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ehr/utils/icons_m.dart';
import 'package:simple_ehr/widget/svg_icon.dart';

import '../../utils/constant.dart';
import '../../utils/styles.dart';
import 'custom_box_shadow.dart';

class WebAppBar extends StatelessWidget {

  WebAppBar({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: CustomBoxShadow.getAppBarShadow(primaryColor),
      ),
      child: Column(
        children: [
          SizedBox(height: 16),
          Expanded(
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: SvgIcon(svgIcon: IconsM.simpleEhrLogo),
                          ),
                        ),
                      ),

                      Center(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 58,
                            width: 700,
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF3F4F6),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                                    child: SvgIcon(svgIcon: IconsM.search),

                                  ),
                                  Expanded(
                                      child:
                                      Text(
                                        'Search doctor...',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: interRegular.fontWeight,
                                            color: const Color(0xFF9CA3AF),
                                            fontSize: 14
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),

                          ),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Padding(
                                padding: EdgeInsets.all(8),
                              child: SvgIcon(svgIcon: IconsM.notification),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: primaryColor, // Border color
                                width: 2,                 // Border width
                              ),
                            ),
                            child: const CircleAvatar(
                              radius: 28, // Radius of the CircleAvatar
                              backgroundImage: NetworkImage(
                                  'https://s3-alpha-sig.figma.com/img/ab2f/238c/ac2c180c370d6398ba04e784c6dc5cb3?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LTmmgCMZrHNSBZJWLCaQlmAlyuPvzAf3BqntcNi6EftKZQOj56-LvZBN9-nmFDV5hWnbE~rsMD0DcuqvHXpOPX6bvIDixAB8sdw7QNVKjU4C5Hokykl7zBkMHcWIbQllM3oi3edj5zp7PVO3uV4uaNX-Q4IG0Gj9rbJVpo0-LyQpsLmTKZECznBMJrCzqDSA3LHc17QEXcd7HEOEhrnNY0T4OGlFod9411wo2DUj5RoJnSdwWJcekMZS22pm40ZOOOzWnjIuqFkMoktq7MA2FrvgaC-VNgU-EVM2~lBS2WloJxvzLHt~mFBqdafVItvTzES6i201oj4WqsdHmKCBxA__'), // Replace with your image URL or asset
                            ),
                          ),
                        ],
                      )

                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
/*if(!ResponsiveHelper.isDesktop(context))
            InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.grey,
                  size: 25,
                ),
              ),
            ),*/
}