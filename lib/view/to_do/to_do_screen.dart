import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ehr/utils/icons_m.dart';
import 'package:simple_ehr/view/base/tab_app_bar.dart';
import 'package:simple_ehr/view/to_do/completed_tab.dart';
import 'package:simple_ehr/view/to_do/components/to_do_side_menu_widget.dart';
import 'package:simple_ehr/view/to_do/due_soon_tab.dart';
import 'package:simple_ehr/view/to_do/removed_tab.dart';
import 'package:simple_ehr/widget/button_with_icon.dart';

import '../../utils/constant.dart';
import '../../utils/styles.dart';
import 'important_tab.dart';

class ToDoScreen extends StatefulWidget {
  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> with TickerProviderStateMixin {
  int currentPageIndex = 0;
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {}); // Rebuild the widget when the tab index changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: PreferredSize(preferredSize: Size.fromHeight(100), child: TabAppBar()),
      
      body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                   children: [
                     SizedBox(height: 16),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                       child: Container(
                         width: double.infinity,
                         child: ButtonWithIcon(
                             icon: IconsM.add,
                             text: 'New Task',
                             press: () {

                             }
                         ),
                       ),
                     ),
                     SizedBox(height: 16),
                     ToDoSideMenuWidget(
                       onPageIndexChanged: (index) {
                         setState(() {
                           currentPageIndex = index;
                         });
                       },
                     )
                   ],
                  )
              ),
              Expanded(
                flex: 11,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    TabBar(
                        controller: tabController,
                        dividerColor: Colors.transparent,
                        isScrollable: true,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                        indicatorColor: Colors.transparent,
                        tabs: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Tab(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                                        IconsM.info,
                                        colorFilter: ColorFilter.mode(tabController.index == 0 ? primaryColor : iconColor, BlendMode.srcIn),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Important',
                                        style: interMedium.copyWith(color: tabController.index == 0 ? textBlueColor : textBlackColor, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Tab(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                                        IconsM.doubleTick,
                                        colorFilter: ColorFilter.mode(tabController.index == 1 ? primaryColor : iconColor, BlendMode.srcIn),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Completed',
                                        style: interMedium.copyWith(color: tabController.index == 1 ? textBlueColor : textBlackColor, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Tab(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                                        IconsM.trash,
                                        colorFilter: ColorFilter.mode(tabController.index == 2 ? primaryColor : iconColor, BlendMode.srcIn),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Removed',
                                        style: interMedium.copyWith(color: tabController.index == 2 ? textBlueColor : textBlackColor, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Tab(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                                        IconsM.menuDot,
                                        colorFilter: ColorFilter.mode(tabController.index == 3 ? primaryColor : iconColor, BlendMode.srcIn),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Due Soon',
                                        style: interMedium.copyWith(color: tabController.index == 3 ? textBlueColor : textBlackColor, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),

                        ]
                    ),
                    Expanded(
                        child: TabBarView(
                            controller: tabController,
                            children: [
                              ImportantTab(),
                              CompletedTab(),
                              RemovedTab(),
                              DueSoonTab()
                            ]
                        )
                    )
                  ],
                ), // Dynamically show the selected screen
                //child: widget.child
              ),
            ],
          )
      ),
    );
  }
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return Container();
      case 1:
        return Container();
      case 2:
        return Container();
      case 3:
        return Container();
      default:
        return Container();
    }
  }
}