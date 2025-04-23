import 'package:flutter/material.dart';
import 'package:solarapp/components/bottomNavBar.dart';

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
        SizedBox(height: 10,),
        buildSettingItem(
            icon: Icons.person_outline,
            title: "Account",
            onTap: () {
              // Navigate to Account page
            },
          ),
          buildSettingItem(
            icon: Icons.solar_power_outlined,
            title: "Solar Details",
            onTap: () {},
          ),
          buildSettingItem(
            icon: Icons.mail_outline,
            title: "Contact Us",
            onTap: () {},
          ),
          buildSettingItem(
            icon: Icons.description_outlined,
            title: "Terms & Conditions",
            onTap: () {},
          ),
          buildSettingItem(
            icon: Icons.lock_outline,
            title: "Privacy Policy",
            onTap: () {},
          ),
          buildSettingItem(
            icon: Icons.info_outline,
            title: "About",
            onTap: () {},
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
      bottomNavigationBar: bottomNavBar(currentIndex: 4,),
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
          leading: Icon(icon, color: Colors.grey[800] ,),
          title: Text(
            title,
            style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16 , color: Colors.grey[800]),
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
        ),
        const Divider(thickness: 0.7, height: 0),
      ],
    );
  }
}
