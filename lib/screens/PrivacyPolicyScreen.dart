import 'package:flutter/material.dart';
import 'package:solarapp/component/CustomBottomNavBar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: const Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: const [
            Text(
              'Last Updated: April 22, 2025\n',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'We at PowerMonitor value your privacy. This Privacy Policy outlines how we collect, use, and protect your personal information when you use our app.\n',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Name, email, phone number, address\nUsage data (e.g., device info, time spent in app)\nLocation & contacts (with your permission)\n'
              'To provide and improve our services\nTo contact you with updates, offers, or support\nTo analyze usage and improve user experience\nFor account management and security\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Your Rights',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'You can:\n'
              '• Access or update your data\n'
              '• Request deletion of your data\n'
              '• Disable location/contacts access anytime in your device settings\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'For any questions, reach out at:\n📧 PowerMonitor@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 4),
    );
  }
}
