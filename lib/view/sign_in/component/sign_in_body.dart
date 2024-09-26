import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ehr/utils/icons_m.dart';

import 'package:simple_ehr/view/sign_in/component/sign_in_form.dart';

import '../../../helper/responsive_helper.dart';
import '../../../utils/images.dart';

import '../../../utils/styles.dart';

import '../../../widget/social_icon.dart';
import 'no_account_text.dart';


class SignInBody extends StatelessWidget {

  const SignInBody({super.key});


  @override
  Widget build(BuildContext context) {
    // Get responsive padding and margin values
    EdgeInsets responsivePadding = ResponsiveHelper.getResponsivePadding(context);


    return SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: responsivePadding,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 70),
                    SvgPicture.asset(IconsM.bigLogo),
                    SizedBox(height: 32),
                    Text(
                      "Hi, Welcome Back!",
                      style: TextStyle(
                        fontWeight: interSemiBold.fontWeight,
                        fontSize: 36,
                        color: Color(0XFF1C2A3A)
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    const Text(
                      "Hope you are doing fine.",
                      style: interRegular,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    SignInForm(),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        //Navigator.pushNamed(context, ForgetPasswordScreen.id);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Forgot password?",
                          style: interMediumBlue,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    const NoAccountText(),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
  
}