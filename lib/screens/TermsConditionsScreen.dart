import 'package:flutter/material.dart';
import 'package:solarapp/component/CustomBottomNavBar.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Terms & Conditions'),
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: const [
            Text(
              'User responsibilities and uses',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'You agree to use PowerMonitur for managing your solar system only, and not for any unlawful or harmful purposes. We may suspend your access if misuse is detected.\n'
              'We are not responsible for any damages resulting from:\n- Inaccurate energy data,\n- System outages,\n- Misuse of the app.',
            ),
            SizedBox(height: 20),
            Text(
              'Data collection',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'In order to deliver our services effectively, we collect certain types of information, including device status, energy production metrics, battery levels, and location data related to your solar energy system. '
              'By using the app, you consent to the collection, use, and storage of this information in accordance with our Privacy Policy. '
              'Your data may be used to improve our services, conduct analytics, develop new features, and provide tailored notifications or recommendations. '
              'We are committed to protecting your personal information and will not sell, rent, or share your data with third parties without your explicit consent.',
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 4),
    );
  }
}
