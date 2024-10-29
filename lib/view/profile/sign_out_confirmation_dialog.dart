import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_ehr/provider/profile_provider.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/styles.dart';

import '../../helper/responsive_helper.dart';
import '../../helper/router_helper.dart';

class SignOutConfirmationDialog extends StatelessWidget {
  const SignOutConfirmationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: SizedBox(
        width: 300,
        child: Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
          return Column(mainAxisSize: MainAxisSize.min, children: [

            const SizedBox(height: 20),
            CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.contact_support, size: 50),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                  'Want to Sign out',
                  style: interSemiBold.copyWith(color: textBlackColor),
                  textAlign: TextAlign.center),
            ),

            Container(height: 0.5, color: Theme.of(context).hintColor),

            !profileProvider.isLoading ? Row(children: [

              Expanded(child: InkWell(
                onTap: () {
                  Provider.of<ProfileProvider>(context, listen: false).logout();
                  if(ResponsiveHelper.isWeb()) {
                    RouterHelper.getLoginRoute(action: RouteAction.pushNamedAndRemoveUntil);
                  }else {
                    context.pop();
                    RouterHelper.getSplashRoute();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))),
                  child: Text('Yes', style: interSemiBold.copyWith(color: textBlackColor),),
                ),
              )),

              Expanded(child: InkWell(
                onTap: () => context.pop(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10)),
                  ),
                  child: Text('No', style: interSemiBold.copyWith(color: textBlackColor),),
                ),
              )),

            ]) : Padding(
              padding: const EdgeInsets.all(8),
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
            ),
          ]);
        }),
      ),
    );
  }
}
