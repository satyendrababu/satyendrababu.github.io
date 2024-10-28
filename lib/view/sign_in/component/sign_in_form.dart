import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ehr/utils/app_context_extension.dart';
import '../../../helper/router_helper.dart';
import '../../../provider/auth_provider.dart';
import '../../../utils/constant.dart';
import '../../../utils/dialogs.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import '../../../utils/utils.dart';
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
  final FocusNode _emailNumberFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  GlobalKey<FormState>? _formKeyLogin;

  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];
  bool isLoading = false;
  bool isError = false;
  AuthProvider? authProvider;

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
    _formKeyLogin = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    authProvider =  Provider.of<AuthProvider>(context, listen: false);
    authProvider!.setIsLoading = false;
  }
  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) => Form(
          key: _formKeyLogin,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                buildEmailFormField(),
                const SizedBox(height: 20),
                buildPasswordFormField(),
                //SizedBox(height: getProportionateScreenHeight(30)),

                //FormError(errors: errors),
                const SizedBox(height: 24),
                !authProvider.isLoading ? DefaultButton(
                    text: "Sign In",
                    press: () async {
                      if(_formKeyLogin!.currentState!.validate()) {
                        _formKeyLogin!.currentState!.save();
                        Utils.hideKeyboard(context);

                        //viewModel.login(email!, password!);
                        await authProvider.login(email, password).then((status) async {
                          print('kya $status');
                          if(status.isSuccess) {
                            RouterHelper.getMainRoute(action: RouteAction.pushNamedAndRemoveUntil);
                          }else {
                            Dialogs.showSnackBar(context, authProvider.loginErrorMessage!);
                          }
                        });
                      }

                    }
                ) : Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                    )),
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


              ],
            ),
          )
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
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      cursorColor: primaryColor,
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
      style: const TextStyle(
          color: textColor
      ),
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
      controller: _passwordController,
      cursorColor: primaryColor,
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
      style: const TextStyle(
        color: textColor
      ),
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