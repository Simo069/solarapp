// import 'package:flutter/material.dart';
// import 'package:solarapp/components/bottomNavBar.dart';

// import 'package:provider/provider.dart';
// import 'package:solarapp/services/fireAuth/UserProvider.dart';
// import 'package:solarapp/Models/UserModel.dart';

// import 'package:intl/intl.dart';

// class editProfile extends StatefulWidget {
//   const editProfile({super.key});

//   @override
//   State<editProfile> createState() => _editProfileState();
// }

// class _editProfileState extends State<editProfile> {
//   // Example controllers with initial values
//   late final TextEditingController firstNameController;
//   late final TextEditingController lastNameController;
//   late final TextEditingController emailController;
//   late final TextEditingController phoneController;
//   late final TextEditingController genderController;
//   late final TextEditingController dobController;
//   int _selectedIndex = 0;

//   void initState() {
//     super.initState();
//     // Initialize controllers or any other setup
//     final user = Provider.of<UserProvider>(context , listen:false).user;
//     firstNameController = TextEditingController(text: user?.firstName);
//     lastNameController = TextEditingController(text: user?.lastName);
//     emailController = TextEditingController(text:user?.email);
//     phoneController = TextEditingController(text:user?.phone);
//     genderController = TextEditingController(text: user?.gender);
//     dobController = TextEditingController(
//   text: user?.dateOfBirth != null ? DateFormat('dd/MM/yyyy').format(user!.dateOfBirth) : '',
// );
//   }
//   @override
//   void dispose() {
//     // Dispose controllers to avoid memory leaks
//     firstNameController.dispose();
//     lastNameController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     genderController.dispose();
//     dobController.dispose();
//     super.dispose();
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         // leading: BackButton(color: Colors.black),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back_ios_new_outlined),
//         ),
//         title: const Text(
//           'Edit Profile',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           children: [
//             buildField(title: "First Name", controller: firstNameController),
//             buildField(title: "last Name", controller: lastNameController),
//             buildField(title: "Email", controller: emailController),
//             buildField(title: "Phone", controller: phoneController),
//             buildField(title: "Gender", controller: genderController),
//             buildField(title: "Date of Birth", controller: dobController),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: _submitForm,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 32,
//                   vertical: 14,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Text(
//                 'Submit',
//                 style: TextStyle(fontSize: 16, color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: bottomNavBar(currentIndex: 4),
//     );
//   }

//   // Function to build text input field
//   Widget buildField({
//     required String title,
//     required TextEditingController controller,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               color: Colors.black54,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12.withOpacity(0.2),
//                   blurRadius: 10,
//                   spreadRadius: 2,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: TextField(
//               controller: controller,
//               decoration: const InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 14,
//                 ),
//                 border: InputBorder.none,
//               ),
//               style: const TextStyle(fontSize: 16, color: Colors.black87),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _submitForm() {
//     // Handle form submit logic here
//     print("First Name: ${firstNameController.text}");
//     print("last Name: ${lastNameController.text}");
//     print("Email: ${emailController.text}");
//     print("Phone: ${phoneController.text}");
//     print("Gender: ${genderController.text}");
//     print("DOB: ${dobController.text}");
//   }
// }

import 'package:flutter/material.dart';
import 'package:solarapp/component/CustomBottomNavBar.dart';
import 'package:solarapp/components/bottomNavBar.dart';

import 'package:provider/provider.dart';
import 'package:solarapp/services/fireAuth/UserProvider.dart';
import 'package:solarapp/Models/UserModel.dart';

import 'package:intl/intl.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController genderController;
  late final TextEditingController dobController;

  int _selectedIndex = 0;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserProvider>(context, listen: false).user;
    firstNameController = TextEditingController(text: user?.firstName);
    lastNameController = TextEditingController(text: user?.lastName);
    emailController = TextEditingController(text: user?.email);
    phoneController = TextEditingController(text: user?.phone);
    genderController = TextEditingController(text: user?.gender);
    if (user?.dateOfBirth != null) {
      selectedDate = user!.dateOfBirth;
      dobController = TextEditingController(
        text: DateFormat('dd/MM/yyyy').format(user.dateOfBirth),
      );
    } else {
      dobController = TextEditingController();
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    genderController.dispose();
    dobController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          selectedDate ?? DateTime(now.year - 18), // default to 18 years ago
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  Future<void> updateProfile() async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      // Optional: show a loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );

      // Create an updated user object
      final updatedUser = UserModel(
        uid: userProvider.user!.uid,
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        gender: genderController.text.trim(),
        dateOfBirth: selectedDate ?? userProvider.user!.dateOfBirth,
      );

      // Update in backend/database (You need to implement this inside your UserProvider or a separate service)
      await userProvider.updateUserProfile(updatedUser);

      // Close the loading dialog
      Navigator.pop(context);

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully' ) , 
        elevation: 6,
        backgroundColor: Colors.green,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            duration: Duration(seconds: 3),
        ),
      );

      // Go back or refresh page
      Navigator.pop(context);
    } catch (error) {
      // Close loading if error happens
      Navigator.pop(context);

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile: $error'),
        elevation: 6,
        backgroundColor: Colors.red,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            duration: Duration(seconds: 3),),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            buildField(title: "First Name", controller: firstNameController),
            buildField(title: "Last Name", controller: lastNameController),
            buildField(title: "Email", controller: emailController),
            buildField(title: "Phone", controller: phoneController),
            buildField(title: "Gender", controller: genderController),
            buildField(
              title: "Date of Birth",
              controller: dobController,
              isDate: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 4,),
    );
  }

  Widget buildField({
    required String title,
    required TextEditingController controller,
    bool isDate = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap:
                isDate
                    ? () {
                      _selectDate(context);
                    }
                    : null,
            child: AbsorbPointer(
              absorbing: isDate,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    print("First Name: ${firstNameController.text}");
    print("Last Name: ${lastNameController.text}");
    print("Email: ${emailController.text}");
    print("Phone: ${phoneController.text}");
    print("Gender: ${genderController.text}");
    print("DOB: ${dobController.text}");
    updateProfile();
  }
}
