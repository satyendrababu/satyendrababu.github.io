import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ehr/utils/constant.dart';

import '../../../data/local/side_menu_data.dart';
import '../../../utils/styles.dart';
import '../../../widget/svg_icon.dart';
import '../../base/custom_box_shadow.dart';

typedef PageIndexCallback = void Function(int pageIndex);
class PatientDetailsSideMenuWidget extends StatefulWidget {

  final PageIndexCallback onPageIndexChanged;
  const PatientDetailsSideMenuWidget({super.key, required this.onPageIndexChanged});

  @override
  State<PatientDetailsSideMenuWidget> createState() => _PatientDetailsSideMenuWidgetState();
}

class _PatientDetailsSideMenuWidgetState extends State<PatientDetailsSideMenuWidget> {

  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onPageIndexChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: CustomBoxShadow.getShadow(primaryColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            /*child: ListView.builder(
              itemCount: data.sideMenuData.length,
              itemBuilder: (context, index) => buildMenuEntry(data, index),
            ),*/
            child: Column(
              children: List.generate(data.sideMenuData.length, (index) {
                return Column(
                  children: [
                    buildMenuEntry(data, index), // Your menu entry widget
                    // Add spacing between items if needed
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {
    final isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: isSelected ? const LinearGradient(
                colors: [startColor, endColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ) : null,
            color: isSelected ? null : Colors.transparent
        ),
        child: InkWell(
          onTap: () => setState(() {
            print("Selected Index: $selectedIndex");
            _onItemTapped(index);
            /*if(data.menu[index].title == ''){

            }else {
              //selectedIndex = index;

            }*/

          }),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8,0),
                child: SvgPicture.asset(
                  data.sideMenuData[index].icon,
                  colorFilter: ColorFilter.mode(isSelected ? Colors.white : iconColor, BlendMode.srcIn),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8,8),
                child: Text(
                  data.sideMenuData[index].title,
                  style: TextStyle(
                      fontSize: 16,
                      color: isSelected ? Colors.white : iconColor,
                      fontWeight: interMediumDefault.fontWeight
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}