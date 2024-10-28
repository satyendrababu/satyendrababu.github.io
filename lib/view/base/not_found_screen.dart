import 'package:flutter/material.dart';

import '../../helper/responsive_helper.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      //appBar: ResponsiveHelper.isDesktop(context) ? const PreferredSize(preferredSize: Size.fromHeight(100), child: WebAppBar()) : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: !ResponsiveHelper.isDesktop(context) && height < 600 ? height : height - 400),
              child: Center(
                child: TweenAnimationBuilder(
                  curve: Curves.bounceOut,
                  duration: const Duration(seconds: 2),
                  tween: Tween<double>(begin: 12.0,end: 30.0),
                  builder: (BuildContext context, dynamic value, Widget? child){
                    return Text('page_not_found',style: TextStyle(fontWeight: FontWeight.bold,fontSize: value));
                  },

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}