import 'package:flutter/material.dart';
import 'package:simple_ehr/view/patients/components/patient_image_widget.dart';

import '../../../widget/submit_button.dart';

class MySliverPage extends StatelessWidget {
  // Controllers for your text fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();

  // Example color and font variables
  final Color blueColor = Colors.blue;
  final Color nameBlackColor = Colors.black;
  final FontWeight interRegular = FontWeight.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Your SliverPersistentHeader
          SliverPersistentHeader(
            pinned: true,
            delegate: MySliverHeaderDelegate(
              minHeight: 80.0, // Minimum height when scrolled
              maxHeight: 150.0, // Maximum height
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PatientImageWidget(),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0XFFC7D8FF)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'MRN:',
                            style: TextStyle(
                              color: blueColor,
                              fontWeight: interRegular,
                              fontSize: 24,
                            ),
                            children: [
                              TextSpan(
                                text: ' 1122334455',
                                style: TextStyle(
                                  color: nameBlackColor,
                                  fontWeight: interRegular,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SubmitButton(
                      text: 'Submit',
                      press: () {
                        // Your submit logic
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Other slivers (e.g., form fields)
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  buildTextField(
                    'Patient First Name',
                    firstNameController,
                    'Please enter first name',
                  ),
                  buildTextField(
                    'Patient Last Name',
                    lastNameController,
                    'Please enter last name',
                  ),
                  buildTextField(
                    'Date of Birth',
                    dateOfBirthController,
                    'Please enter date of birth',
                  ),
                  buildTextField(
                    'Email Address',
                    emailController,
                    'Please enter a valid email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  buildTextField(
                    'Contact Number',
                    contactNumberController,
                    'Please enter contact number',
                  ),
                  buildGenderSelection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Example implementations of buildTextField and buildGenderSelection
  Widget buildTextField(String label, TextEditingController controller, String hint,
      {String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

  Widget buildGenderSelection() {
    // Implement your gender selection widget
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Gender',
        border: OutlineInputBorder(),
      ),
      items: ['Male', 'Female', 'Other']
          .map((gender) => DropdownMenuItem<String>(
        value: gender,
        child: Text(gender),
      ))
          .toList(),
      onChanged: (value) {
        // Handle gender selection
      },
    );
  }
}
class MySliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  MySliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // You can add animations or transformations based on shrinkOffset if needed
    return Container(
      color: Colors.white, // Set background color if needed
      child: child,
    );
  }

  @override
  bool shouldRebuild(MySliverHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}