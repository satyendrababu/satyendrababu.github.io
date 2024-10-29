import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/view/profile/change_password_dialog.dart';
import 'package:simple_ehr/view/profile/profile_dialog.dart';
import 'package:simple_ehr/view/profile/sign_out_confirmation_dialog.dart';
import 'package:simple_ehr/widget/svg_icon.dart';

import '../../utils/icons_m.dart';

class ProfileOptionsDialog extends StatelessWidget {
  const ProfileOptionsDialog({super.key});


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: Colors.white,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top Section with Image and Name
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0XFF2C67F2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0x802C67F2), // Border color
                              width: 4, // Border width
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 28, // Radius of the CircleAvatar
                            backgroundImage: AssetImage('assets/images/girl.png'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lisa Smith',
                          style: interMedium.copyWith(
                            color: Colors.white,
                          ),
                        ),

                        Text(
                          'Clerk',
                          style: interMedium.copyWith(
                              color: const Color(0XFFC7D8FF)
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ),
            // Options Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildDialogOption(
                    context,
                    icon: IconsM.userBlack,
                    label: 'Profile Settings',
                    onTap: () {
                      Navigator.of(context).pop();
                      showDialog(context: context,
                          builder: (context) => const ProfileDialog()
                      );
                    },
                  ),
                  _buildDialogOption(
                    context,
                    icon: IconsM.lockBlack,
                    label: 'Change Password',
                    onTap: () {
                      Navigator.of(context).pop();
                      showDialog(context: context,
                          builder: (context) => ChangePasswordDialog()
                      );
                    },
                  ),
                  _buildDialogOption(
                    context,
                    icon: IconsM.logoutBlack,
                    label: 'Logout',
                    onTap: () {
                      Navigator.of(context).pop();
                      showDialog(context: context,
                          builder: (context) => const SignOutConfirmationDialog()
                      );
                      // Handle Logout
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogOption(BuildContext context, {required String icon, required String label, required VoidCallback onTap}) {
    return ListTile(
      leading: SvgIcon(svgIcon: icon),
      title: Text(
          label,
          style: interMedium.copyWith(
            color: textBlackColor
          )
      ),
      onTap: onTap,
    );
  }

}