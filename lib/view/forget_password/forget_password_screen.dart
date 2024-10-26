import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import 'package:simple_ehr/utils/icons_m.dart';
import '../../helper/responsive_helper.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';
import '../../widget/back_icon.dart';
import 'components/forget_password_form.dart';

class ForgetPasswordScreen extends StatelessWidget {

  const ForgetPasswordScreen({super.key});

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
                /*GestureDetector(
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset(Images.backIcon)
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }
                ),*/
                //const BackIcon(),

                SizedBox(
                  width: 196,
                  height: 97,
                  child: SvgPicture.asset(IconsM.bigLogo),
                ),
                const SizedBox(height: 32),
                const Text(
                  "Forget Password?",
                  style: interSemiBold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Enter your Email, we will send you a verification \ncode.",
                  style: interRegular,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                const ForgetPasswordForm(),
                const SizedBox(height: 24),

              ],
            ),
          ),
        ),
      ),
    );
  }

}