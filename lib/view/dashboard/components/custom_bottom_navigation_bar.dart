import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/icons_m.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/widget/bottom_bar_icon.dart';

import '../../page_index_provider.dart';

typedef PageIndexCallback = void Function(int pageIndex);

class CustomBottomNavigationBar extends StatefulWidget {

  final PageIndexCallback onPageIndexChanged;
  const CustomBottomNavigationBar({super.key, required this.onPageIndexChanged});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int pageIndex = 0;


  @override
  Widget build(BuildContext context) {
    final pageIndexNotifier = Provider.of<PageIndexProvider>(context);
    pageIndex = pageIndexNotifier.currentIndex;

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: _buildIcon(0, IconsM.home),
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: _buildIcon(1, IconsM.patientAdd),
            label: 'Patients'
        ),
        BottomNavigationBarItem(
            icon: _buildIcon(2, IconsM.toDo),
            label: 'To Do'
        ),
        BottomNavigationBarItem(
            icon: _buildIcon(3, IconsM.myNote),
            label: 'My Note'
        )
      ],
      currentIndex: pageIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: textBlueColor,
      unselectedItemColor: textColor,


    );

  }

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
    widget.onPageIndexChanged(pageIndex);
  }

  Widget _buildIcon(int index, String svgIcon) {
    bool isSelected = pageIndex == index;
    return Container(
      padding: const EdgeInsets.all(8.0),

      decoration: isSelected
          ? BoxDecoration(
        border: Border.all(color: primaryColor, width: 1.0),
        borderRadius: BorderRadius.circular(12.0),
        color: selectionColor,
      )
          : null,
      child: BottomBarIcon(svgIcon: svgIcon, isSelected: isSelected),
    );
  }
  Widget _buildText(int index, String text) {
    bool isSelected = pageIndex == index;
    return Text(
      text,
      style: TextStyle(
        fontWeight: interRegular.fontWeight,
        color: isSelected ? primaryColor : defaultColor
      ),
    );
  }
}
