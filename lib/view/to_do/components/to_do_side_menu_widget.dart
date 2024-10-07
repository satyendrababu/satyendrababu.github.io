import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/local/side_menu_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/icons_m.dart';
import '../../../utils/styles.dart';
import '../../base/custom_box_shadow.dart';

typedef PageIndexCallback = void Function(int pageIndex);
class ToDoSideMenuWidget extends StatefulWidget{
  final PageIndexCallback onPageIndexChanged;
  const ToDoSideMenuWidget({super.key, required this.onPageIndexChanged});

  @override
  State<ToDoSideMenuWidget> createState() => _ToDoSideMenuWidgetState();
}

class _ToDoSideMenuWidgetState extends State<ToDoSideMenuWidget> {
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
      child: Column(
        children: List.generate(data.toDoMenuData.length, (index) {
          return Column(
            children: [
              buildMenuEntry(data, index), // Your menu entry widget
              // Add spacing between items if needed
            ],
          );
        }),
      ),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {
    final isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: InkWell(
        onTap: () => setState(() {
          print("Selected Index: $selectedIndex");
          _onItemTapped(index);

        }),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white, // Button background color
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.2), // Shadow color
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 4), // Position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                data.toDoMenuData[index].icon,
                //colorFilter: ColorFilter.mode(isSelected ? primaryColor : iconColor, BlendMode.srcIn),
              ),
              SizedBox(width: 8),
              Text(
                data.toDoMenuData[index].title,
                //style: interMedium.copyWith(color: isSelected ? textBlueColor : textBlackColor, fontSize: 16),
                style: interMedium.copyWith(color: textBlackColor, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

}