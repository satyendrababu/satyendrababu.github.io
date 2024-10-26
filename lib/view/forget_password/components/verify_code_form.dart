import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import '../../../helper/router_helper.dart';
import '../../../widget/default_button.dart';

class VerifyCodeForm extends StatefulWidget {
  const VerifyCodeForm({super.key});


  @override
  State<VerifyCodeForm> createState() => _VerifyCodeFormState();
}

class _VerifyCodeFormState extends State<VerifyCodeForm> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PinCodeTextField(
          length: 6,
          appContext: context,
          obscureText: false,
          keyboardType: TextInputType.number,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            fieldHeight: 56,
            fieldWidth: 56,
            borderWidth: 1,
            borderRadius: BorderRadius.circular(12),
            selectedColor: context.resources.color.colorEnd,
            selectedFillColor: const Color(0XFFF3F4F6),
            inactiveFillColor: const Color(0XFFF3F4F6),
            inactiveColor: const Color(0XFFE5E7EB),
            activeColor: context.resources.color.colorStart,
            activeFillColor: const Color(0XFFF3F4F6),
          ),
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          //onChanged: authProvider.updateVerificationCode,
          beforeTextPaste: (text) {
            return true;
          },
        ),
        const SizedBox(height: 32),
        DefaultButton(
            text: "Verify",
            press: () {

                //viewModel.login(email!, password!);

              RouterHelper.getCreateNewPasswordRoute(action: RouteAction.push);
              }
        ),
      ],
    );
  }
}