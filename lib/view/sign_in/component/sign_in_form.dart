import 'package:flutter/material.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';


import '../../../data/remote/response/status.dart';
import '../../../utils/constant.dart';
import '../../../utils/dialogs.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import '../../../utils/utils.dart';
import '../../../view_model/login_vm.dart';
import '../../../widget/default_button.dart';
import '../../../widget/loading_widget.dart';
import '../../../widget/my_error_widget.dart';
import '../../../widget/svg_suffix_icon.dart';
import '../../../widget/social_icon.dart';


class SignInForm extends StatefulWidget {

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];
  final LoginVM viewModel = LoginVM();
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
    viewModel.addListener(() {
      switch (viewModel.loginData.status) {
        case Status.LOADING:

          //LoadingWidget();
          setState(() {
            isLoading = true;
          });
          break;
        case Status.ERROR:

          setState(() {
            isLoading = false;
            isError = true;
          });
          //MyErrorWidget(viewModel.loginData.message ?? "NA");
          break;
        case Status.COMPLETED:
          //Navigator.pushNamed(context, HomeScreen.id);
         /* Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomeScreen()));*/
          break;
        default:
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              buildEmailFormField(),
              SizedBox(height: 20),
              buildPasswordFormField(),
              //SizedBox(height: getProportionateScreenHeight(30)),

              //FormError(errors: errors),
              SizedBox(height: 24),
              DefaultButton(
                  text: "Sign In",
                  press: () {
                    if(_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Utils.hideKeyboard(context);

                      print("MARAJ $email");
                      print("MARAJ $password");
                      setState(() {
                        isLoading = true;
                      });
                      //viewModel.login(email!, password!);

                      //Navigator.pushNamed(context, HomeScreen.id);
                    }
                    Dialogs.showSnackBar(context, errors[0]!);
                  }
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Container(height: 1, color: const Color(0XFFE5E7EB))),
                  const SizedBox(width: 20),
                  const Text('or', style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: Dimensions.fontSizeLarge,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF6B7280)
                  )),
                  const SizedBox(width: 20),
                  Expanded(child: Container(height: 1, color: const Color(0XFFE5E7EB))),

                ],
              ),
              const SizedBox(height: 24),
              SocialIcon(
                  icon: Images.google,
                  text: 'Continue with Google',
                  press: () {

                  }
              ),
              const SizedBox(height: 20),
              SocialIcon(
                  icon: Images.facebook,
                  text: 'Continue with Facebook',
                  press: () {

                  }
              ),
              Visibility(
                visible: isLoading,
                  child: LoadingWidget()
              ),
              Visibility(
                visible: isError,
                  child: MyErrorWidget(viewModel.loginData.message ?? "NA")
              )

            ],
          ),
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
  TextFormField buildPasswordFormField() {
    OutlineInputBorder buildOutlineInputBorder(Color borderColor, {double borderWidth = 1.0}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor, width: borderWidth),
      );
    }
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: mPassNullError);
        } else if (value.length >= 8) {
          removeError(error: mShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: mPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: mShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: textHintStyle,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        border: buildOutlineInputBorder(Colors.transparent), // Default border (no border)
        focusedBorder: buildOutlineInputBorder(Colors.blue), // Border when focused
        enabledBorder: buildOutlineInputBorder(context.resources.color.colorTextFieldBorder), // Border when enabled
        errorBorder: buildOutlineInputBorder(Colors.red), // Border when error
        focusedErrorBorder: buildOutlineInputBorder(Colors.red), // Border when focused with error
        filled: true,
        fillColor: context.resources.color.colorTextFieldFill, // Background color of the TextFormField
        prefixIcon: const SvgSuffixIcon(svgIcon: Images.lock),
      ),
    );
  }

}