import 'package:flutter/material.dart';
import 'package:solarapp/components/bottomNavBar.dart';



class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  // Example controllers with initial values
  late final TextEditingController fullNameController;
  late final TextEditingController emailController ;
  late final TextEditingController phoneController ;
  late final TextEditingController genderController ;
  late final TextEditingController dobController ;
  int _selectedIndex = 0;

  void initState() {
    
    super.initState();
    // Initialize controllers or any other setup
    fullNameController = TextEditingController(text: "badal omar");
    emailController = TextEditingController(text: "omar.badal@gmail.com");
    phoneController = TextEditingController(text: "+212 604 470 620");
    genderController = TextEditingController(text: "male");
    dobController = TextEditingController(text: "01- November- 1961");
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
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
            buildField(title: "Full Name", controller: fullNameController),
            buildField(title: "Email", controller: emailController),
            buildField(title: "Phone", controller: phoneController),
            buildField(title: "Gender", controller: genderController),
            buildField(title: "Date of Birth", controller: dobController),
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
              child: const Text('Submit', style: TextStyle(fontSize: 16 , color: Colors.white)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar(currentIndex: 4 ),
    );
  }
  // Function to build text input field
  Widget buildField({
    required String title,
    required TextEditingController controller,
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
          Container(
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
        ],
      ),
    );
  }

  void _submitForm() {
    // Handle form submit logic here
    print("Full Name: ${fullNameController.text}");
    print("Email: ${emailController.text}");
    print("Phone: ${phoneController.text}");
    print("Gender: ${genderController.text}");
    print("DOB: ${dobController.text}");
  }
}
