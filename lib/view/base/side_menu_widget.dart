import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ehr/data/local/side_menu_data.dart';
import 'package:simple_ehr/utils/icons_m.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/widget/svg_icon.dart';

import '../../utils/constant.dart';

class SideMenuWidget extends StatefulWidget {
  SideMenuWidget({super.key});



  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgIcon(svgIcon: IconsM.frame),
              SizedBox(height: 8,),
              Expanded(
                child: ListView.builder(
                    itemCount: data.menu.length,
                    itemBuilder: (context, index) => buildMenuEntry(data, index)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {
    final isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(26)),
          color: isSelected ? selectionColor : Colors.transparent
        ),
        child: InkWell(
          onTap: () => setState(() {
            if(data.menu[index].title == ''){

            }else {
              selectedIndex = index;
            }
          }),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
                child: SvgPicture.asset(
                    data.menu[index].icon,
                  colorFilter: ColorFilter.mode(isSelected ? primaryColor : defaultColor, BlendMode.srcIn),
                ),
              ),
              Text(
                  data.menu[index].title,
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? primaryColor : defaultColor,
                    fontWeight: interMediumDefault.fontWeight
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}