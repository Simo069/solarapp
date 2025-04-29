import 'package:flutter/material.dart';
import 'package:solarapp/component/CustomBottomNavBar.dart';
import 'package:solarapp/components/bottomNavBar.dart';
import 'package:solarapp/screens/auth/createAccount.dart';

class settingScreen extends StatefulWidget {
  settingScreen({super.key});
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  int _selectedIndex = 4;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(height: 10),
          buildSettingItem(
            icon: Icons.person_outline,
            title: "Account",
            onTap: () {
              Navigator.pushNamed(context, '/AccountScreen');
            },
          ),
          buildSettingItem(
            icon: Icons.solar_power_outlined,
            title: "Solar Details",
<<<<<<< HEAD
            onTap: () {},
=======
            onTap: () {
              Navigator.pushNamed(context, '/solarDetailscreenparameter');
            },
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
          ),
          buildSettingItem(
            icon: Icons.mail_outline,
            title: "Contact Us",
            onTap: () {},
          ),
          buildSettingItem(
            icon: Icons.description_outlined,
            title: "Terms & Conditions",
<<<<<<< HEAD
            onTap: () {
              Navigator.pushNamed(context, '/TermsConditionsScreen');
            },
=======
            onTap: () {},
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
          ),
          buildSettingItem(
            icon: Icons.lock_outline,
            title: "Privacy Policy",
<<<<<<< HEAD
            onTap: () {
              Navigator.pushNamed(context, '/PrivacyPolicyScreen');
            },
=======
            onTap: () {},
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
          ),
          buildSettingItem(
            icon: Icons.info_outline,
            title: "About",
<<<<<<< HEAD
            onTap: () {
              Navigator.pushNamed(context, '/AboutUsScreen');
            },
=======
            onTap: () {},
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
          ),
          buildSettingItem(
            icon: Icons.logout,
            title: "Logout",
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 4),
    );
  }

  Widget buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.grey[800]),
          title: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: Colors.grey[800],
          ),
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
        ),
        const Divider(thickness: 0.7, height: 0),
      ],
    );
  }
}
