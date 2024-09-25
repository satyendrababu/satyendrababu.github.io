import 'package:flutter/material.dart';
import 'package:simple_ehr/helper/responsive_helper.dart';
import 'package:simple_ehr/view/base/side_menu_widget.dart';
import 'package:simple_ehr/view/base/web_app_bar.dart';
import 'package:simple_ehr/view/dashboard/dashboard_screen.dart';

import 'dashboard/components/top_data_widget.dart';

class MainScreen extends StatelessWidget {

  const MainScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveHelper.isDesktop(context) ? PreferredSize(preferredSize: const Size.fromHeight(100), child: WebAppBar()) : null,
      ///PreferredSize(preferredSize: Size.fromHeight(100), child: WebAppBar()),
      //ResponsiveHelper.isDesktop(context) ? const PreferredSize(preferredSize: Size.fromHeight(100), child: WebAppBar()) : null,
      body: SafeArea(
          child: Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                  flex: 2,
                  child: SizedBox(
                    child: SideMenuWidget(),
                  )
              ),
              const Expanded(
                  flex: 8,
                  child: DashboardScreen()
                  //child: TopDataWidget()
              ),

            ],
          )
      ),
    );
  }

}