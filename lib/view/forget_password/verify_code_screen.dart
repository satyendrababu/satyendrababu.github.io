import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import 'package:simple_ehr/utils/icons_m.dart';
import '../../helper/responsive_helper.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';
import '../../widget/back_icon.dart';
import 'components/verify_code_form.dart';

class VerifyCodeScreen extends StatelessWidget {

  static String id = "verify_code_screen";

  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets responsivePadding = ResponsiveHelper.getResponsivePadding(context);
    return Scaffold(
      backgroundColor: context.resources.color.colorWhite,
      body: Padding(
        padding: responsivePadding,
        child: SizedBox(
          width: double.infinity,
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
                  "Verify Code",
                  style: interSemiBold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Enter the the code \nwe just sent you on your registered Email",
                  style: interRegular,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                VerifyCodeForm(),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn’t get the Code?",
                      style: interRegular,
                    ),
                    GestureDetector(
                      onTap: () {
                        //Navigator.pushNamed(context, SignUpScreen.id);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Resend",
                          style: interMediumBlue,
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

}