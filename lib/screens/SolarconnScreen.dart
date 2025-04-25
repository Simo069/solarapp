import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'SolarDetailsScreen.dart';
import '/component/CustomBottomNavBar.dart';

class SolarconnScreen extends StatefulWidget {
  const SolarconnScreen({super.key});

  @override
  _SolarconnScreenState createState() => _SolarconnScreenState();
}

class _SolarconnScreenState extends State<SolarconnScreen> {
  int _selectedIndex = 0; // Gérer l'index de la navbar

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Logique de navigation ou autre action
  }

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('EEEE d, y').format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            children: [
              // Header
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hi Hiba",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      currentDate,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 79, 88, 92),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Illustration (sécurisée avec Image.asset + errorBuilder)
              Expanded(
                child: Image.asset(
                  'assets/images/solarconn.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.broken_image_outlined,
                        size: 100,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              // No data message
              const Text(
                "No data found!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Please connect your solar system\nto check the status here.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),

              const SizedBox(height: 20),

              // Bouton Connect Solar
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00C853), Color(0xFF2E7D32)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SolarDetailsScreen(),
                      ),
                    );
                  },

                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Connect Solar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: _onNavItemTapped,
      //   currentIndex: _selectedIndex, // à ajouter si tu gardes le paramètre
      // ),
    );
  }
}
