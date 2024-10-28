import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ehr/utils/icons_m.dart';
import 'package:simple_ehr/widget/svg_icon.dart';

import '../../helper/router_helper.dart';
import '../../utils/constant.dart';
import '../../utils/styles.dart';
import 'custom_box_shadow.dart';

class TabAppBar extends StatelessWidget {

  TabAppBar({super.key});



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
                        child: Text(
                          'Home',
                          style: TextStyle(
                            fontWeight: interMedium.fontWeight,
                            color: textColor,
                            fontSize: 24
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
                          GestureDetector(
                            onTap: () {
                              RouterHelper.getProfileRoute(action: RouteAction.push);
                            },
                            child: Container(
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
                                backgroundImage: AssetImage(
                                    'assets/images/girl.png'), // Replace with your image URL or asset
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                              child: SvgIcon(svgIcon: IconsM.arrowDownBlue),
                            ),
                          ),
                          SizedBox(width: 16),
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