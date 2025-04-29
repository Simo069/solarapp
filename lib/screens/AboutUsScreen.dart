import 'package:flutter/material.dart';
import 'package:solarapp/component/CustomBottomNavBar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle greenBold = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.green,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('About us'),
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text('Who we are', style: greenBold),
            const SizedBox(height: 8),
            const Text(
              'We are a passionate team committed to promoting clean, sustainable energy through smart solar solutions. Our app helps users monitor, manage, and optimize their solar panel systems with ease.',
            ),
            const SizedBox(height: 20),
            Text('Our Mission', style: greenBold),
            const SizedBox(height: 8),
            const Text(
              'To make solar energy simple, accessible, and efficient for everyone — helping build a greener future, one panel at a time.',
            ),
            const SizedBox(height: 20),
            Text('Why Choose Us?', style: greenBold),
            const SizedBox(height: 8),
            const Text('✔ User-friendly interface'),
            const Text('✔ Accurate data insights'),
            const Text('✔ Committed customer support'),
            const Text('✔ Eco-conscious innovation'),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 4),
    );
  }
}
