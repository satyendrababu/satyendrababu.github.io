import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';

import '../../../helper/router_helper.dart';
import '../../../utils/constant.dart';
import '../../../utils/dialogs.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import '../../../utils/utils.dart';

import '../../../widget/svg_suffix_icon.dart';
import '../../../widget/default_button.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {

  final _formKey = GlobalKey<FormState>();
  String? email;

  final List<String?> errors = [];

  bool isLoading = false;
  bool isError = false;

  void addError({String? error}){





    if(!errors.contains(error)){
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}){
    if(errors.contains(error)){
      setState(() {
        errors.remove(error);
      });
    }
  }
  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),

            SizedBox(height: 32),
            DefaultButton(
                text: "Send Code",
                press: () {
                  if(_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Utils.hideKeyboard(context);

                    print("MARAJ $email");
                    setState(() {
                      isLoading = true;
                    });
                    //viewModel.login(email!, password!);
                  }
                  RouterHelper.getVerifyCodeRoute(action: RouteAction.push);
                  Dialogs.showSnackBar(context, errors[0]!);
                }
            ),


          ],
        )
    );
  }

  TextFormField buildEmailFormField() {
    OutlineInputBorder buildOutlineInputBorder(Color borderColor, {double borderWidth = 1.0}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor, width: borderWidth),
      );
    }
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: mEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: mInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: mEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: mInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Your Email",
        hintStyle: textHintStyle,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        border: buildOutlineInputBorder(Colors.transparent), // Default border (no border)
        focusedBorder: buildOutlineInputBorder(Colors.blue), // Border when focused
        enabledBorder: buildOutlineInputBorder(context.resources.color.colorTextFieldBorder), // Border when enabled
        errorBorder: buildOutlineInputBorder(Colors.red), // Border when error
        focusedErrorBorder: buildOutlineInputBorder(Colors.red), // Border when focused with error
        filled: true,
        fillColor: context.resources.color.colorTextFieldFill, // Background color of the TextFormField
        prefixIcon: const SvgSuffixIcon(svgIcon: Images.email),
      ),
    );
  }
}