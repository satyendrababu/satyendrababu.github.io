import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:simple_ehr/widget/default_button.dart';
import 'package:simple_ehr/widget/svg_icon.dart';

import '../../data/model/response/user_info_model.dart';
import '../../provider/auth_provider.dart';
import '../../provider/profile_provider.dart';
import '../../utils/constant.dart';
import '../../utils/dialogs.dart';
import '../../utils/icons_m.dart';
import '../../utils/styles.dart';
import '../../utils/utils.dart';
import '../../widget/button_with_icon.dart';
import '../../widget/custom_text_field.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {

  GlobalKey<FormState>? _formKeyPassword;
  TextEditingController? _oldPasswordController;
  TextEditingController? _newPasswordController;
  TextEditingController? _confirmPasswordController;
  late bool _isLoggedIn;
  String? oldPassword;
  String? newPassword;
  String? confirmPassword;

  @override
  void initState() {
    super.initState();
    final ProfileProvider profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    final AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
    _isLoggedIn = authProvider.isLoggedIn();

    _formKeyPassword = GlobalKey<FormState>();
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();


  }


  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
          return Form(
            key: _formKeyPassword,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Change Password',
                      style: interSemiBold.copyWith(
                          color: textBlackColor,
                          fontSize: 20
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgIcon(svgIcon: IconsM.crossClose),
                    )
                  ],
                ),

                const SizedBox(height: 32),
                CustomTextField(
                  label: 'Old Password', isPassword: true, controller: _oldPasswordController,onChanged: (value) => oldPassword = value),
                const SizedBox(height: 32),
                CustomTextField(
                  label: 'New Password', isPassword: true,controller: _newPasswordController, onChanged: (value) => newPassword = value),
                const SizedBox(height: 32),
                CustomTextField(
                  label: 'Confirm Password', isPassword: true, controller: _confirmPasswordController,onChanged: (value) => confirmPassword = value),

                const SizedBox(height: 40),
                /*ButtonWithIcon(
                    icon: '',
                    text: 'Update',
                    press: () async {
                      debugPrint('Clicked.........');
                      if(_formKeyPassword!.currentState!.validate()) {
                        _formKeyPassword!.currentState!.save();
                        Utils.hideKeyboard(context);
                        await profileProvider.changePassword({"old_password": oldPassword, "new_password":newPassword,"confirm_new_password":confirmPassword}).then((status) async {
                          if(status.isSuccess){
                            Navigator.of(context).pop();

                          }else {
                            Dialogs.showSnackBar(context, profileProvider.loginErrorMessage!);
                          }
                        });
                      }
                    }
                ),*/
                !profileProvider.isLoading ? DefaultButton(
                    //icon: '',
                    text: 'Update',
                    press: () async {
                      debugPrint('Clicked.........');
                      if(_formKeyPassword!.currentState!.validate()) {
                        _formKeyPassword!.currentState!.save();
                        Utils.hideKeyboard(context);
                        oldPassword = _oldPasswordController!.text.trim();
                        newPassword = _newPasswordController!.text.trim();
                        confirmPassword = _confirmPasswordController!.text.trim();

                        await profileProvider.changePassword({"old_password": oldPassword, "new_password":newPassword,"confirm_new_password":confirmPassword}).then((status) async {
                          if(status.isSuccess){
                            Navigator.of(context).pop();
                            Dialogs.showSnackBar(context, 'Password has been changed successfully',isError: false);

                          }else {
                            Dialogs.showSnackBar(context, 'Something went wrong');
                          }
                        });
                      }
                    }
                )
                    : Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                    )) ,

                const SizedBox(height: 28),


              ],
            ),
          );
        }
    );
  }
}