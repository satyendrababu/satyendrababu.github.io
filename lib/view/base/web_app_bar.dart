import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ehr/utils/icons_m.dart';
import 'package:simple_ehr/widget/svg_icon.dart';

import '../../helper/router_helper.dart';
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
                                    'assets/images/girl.png'),),
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