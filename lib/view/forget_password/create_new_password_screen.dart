import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import 'package:simple_ehr/utils/icons_m.dart';
import '../../helper/responsive_helper.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';
import '../../widget/back_icon.dart';
import 'components/create_new_password_form.dart';

class CreateNewPasswordScreen extends StatelessWidget {

  const CreateNewPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    EdgeInsets responsivePadding = ResponsiveHelper.getResponsivePadding(context);

    return Scaffold(
      backgroundColor: context.resources.color.colorWhite,
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: responsivePadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                /*SizedBox(height: 70),
                GestureDetector(
                    child: Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(Images.backIcon)
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }
                ),
                SizedBox(height: 32),*/
                //const BackIcon(),
                SizedBox(
                  width: 196,
                  height: 97,
                  child: SvgPicture.asset(IconsM.bigLogo),
                ),
                const SizedBox(height: 32),
                const Text(
                  "Create New Password",
                  style: interSemiBold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Your new password must be different form \npreviously used password",
                  style: interRegular,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                const CreateNewPasswordForm(),
                const SizedBox(height: 24),

              ],
            ),
          ),
        ),
      ),
    );
  }

}