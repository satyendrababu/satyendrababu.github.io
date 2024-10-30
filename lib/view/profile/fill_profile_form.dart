import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:simple_ehr/data/model/response/user_info_model.dart';
import 'package:simple_ehr/utils/constant.dart';
import 'package:simple_ehr/utils/icons_m.dart';
import 'package:simple_ehr/utils/styles.dart';
import 'package:simple_ehr/widget/button_with_icon.dart';
import 'package:simple_ehr/widget/svg_icon.dart';

import '../../provider/auth_provider.dart';
import '../../provider/profile_provider.dart';
import '../../utils/dialogs.dart';
import '../../utils/utils.dart';
import '../../widget/custom_dropdown_menu.dart';
import '../../widget/custom_radio_button.dart';
import '../../widget/custom_text_field.dart';
import '../../widget/default_button.dart';

class FillProfileForm extends StatefulWidget {
  @override
  _FillProfileFormState createState() => _FillProfileFormState();
}

class _FillProfileFormState extends State<FillProfileForm> {
  GlobalKey<FormState>? _formKeyProfile;
  TextEditingController? _firstNameController;
  TextEditingController? _lastNameController;
  TextEditingController? _genderController;
  TextEditingController? _roleController;
  TextEditingController? _mobileController;
  TextEditingController? _emailController;

  late bool _isLoggedIn;
  String? _image;
  late Size mq;
  String? firstName;
  String? lastName;
  String? gender;

  @override
  void initState() {
    super.initState();
    final ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    _isLoggedIn = authProvider.isLoggedIn();
    _formKeyProfile = GlobalKey<FormState>();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _genderController = TextEditingController();
    _roleController = TextEditingController();
    _mobileController = TextEditingController();
    _emailController = TextEditingController();

    if (_isLoggedIn) {
      profileProvider.getUserInfo(true).then((_) {
        UserInfoModel? userInfoModel = profileProvider.userInfoModel;
        if (userInfoModel != null) {
          _firstNameController!.text = userInfoModel.data!.firstName ?? '';
          _lastNameController!.text = userInfoModel.data!.lastName ?? '';
          _genderController!.text = userInfoModel.data!.gender ?? '';
          _roleController!.text = userInfoModel.data!.user!.role ?? '';
          _mobileController!.text = userInfoModel.data!.phone ?? '';
          _emailController!.text = userInfoModel.data!.user!.email ?? '';
          gender = userInfoModel.data!.gender ?? 'Male';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
      return Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile Settings',
                  style: interSemiBold.copyWith(
                      color: textBlackColor, fontSize: 20),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgIcon(svgIcon: IconsM.crossClose),
                )
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0x802C67F2), // Border color
                        width: 8, // Border width
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 80, // Radius of the CircleAvatar
                      backgroundImage: AssetImage('assets/images/girl.png'),
                    ),
                  ),
                  Positioned(
                      right: 20,
                      bottom: 20,
                      child: InkWell(
                          onTap: () {
                            _showBottomSheet();
                          },
                          child: SvgPicture.asset(IconsM.cameraIcon)))
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Flexible(
                    child: CustomTextField(
                  label: 'First Name',
                  controller: _firstNameController,
                  hintText: 'Enter First Name',
                )),
                const SizedBox(width: 16),
                Flexible(
                    child: CustomTextField(
                        label: 'Last Name',
                        controller: _lastNameController,
                        hintText: 'Enter Last Name')),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Flexible(
                    child: !profileProvider.isLoading
                        ? CustomRadioButton(
                            label: 'Gender',
                            options: const ['Male', 'Female', 'Other'],
                            initialSelectedItem: Utils.capitalize(
                                profileProvider.userInfoModel?.data?.gender),
                            onSelectionChanged: (value) {
                              gender = value;
                            })
                        : CustomTextField(
                            label: 'Gender',
                          )),
                const SizedBox(width: 16),
                Flexible(
                    child: CustomTextField(
                  label: 'Role',
                  controller: _roleController,
                  isDisable: true,
                )),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Flexible(
                    child: CustomTextField(
                  label: 'Mobile No.',
                  controller: _mobileController,
                  isDisable: true,
                )),
                const SizedBox(width: 16),
                Flexible(
                    child: CustomTextField(
                  label: 'Email Address',
                  controller: _emailController,
                  isDisable: true,
                )),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: !profileProvider.isLoading
                    ? DefaultButton(
                        //icon: '',
                        text: 'Update',
                        press: () async {
                          firstName = _firstNameController!.text.trim();
                          lastName = _lastNameController!.text.trim();

                          //_formKeyProfile!.currentState!.save();
                          Utils.hideKeyboard(context);

                          await profileProvider.updateUserInfo({
                            "first_name": firstName,
                            "last_name": lastName,
                            "gender": gender!.toLowerCase()
                          }).then((status) async {
                            if (status.isSuccess) {
                              Navigator.of(context).pop();
                              Dialogs.showSnackBar(
                                  context, 'Details have been updated',
                                  isError: false);
                            } else {
                              Dialogs.showSnackBar(
                                  context, 'Something went wrong');
                            }
                          });
                        })
                    : Center(
                        child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                      )),
              ),
            ),
            const SizedBox(height: 28),
          ],
        ),
      );
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pick Profile Picture',
                      style: interSemiBold.copyWith(
                          color: textBlackColor, fontSize: 20),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgIcon(svgIcon: IconsM.crossClose),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                            fixedSize: Size(mq.width * 0.2, mq.height * 0.2)),
                        onPressed: () async {
                          final ImagePicker _picker = ImagePicker();
                          final XFile? image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          if (image != null) {
                            setState(() {
                              _image = image.path;
                            });
                            //APIs.updateProfilePicture(File(_image!));
                            Navigator.pop(context);
                          }
                        },
                        child: Image.asset('images/add_image.png')),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                            fixedSize: Size(mq.width * 0.2, mq.height * 0.2)),
                        onPressed: () async {
                          final ImagePicker _picker = ImagePicker();
                          final XFile? image = await _picker.pickImage(
                              source: ImageSource.camera);
                          if (image != null) {
                            setState(() {
                              _image = image.path;
                            });
                            //APIs.updateProfilePicture(File(_image!));
                            Navigator.pop(context);
                          }
                        },
                        child: Image.asset('images/camera.png'))
                  ],
                ),
              ],
            ),
          );
        });
  }
}
