import 'package:flutter/material.dart';
import '../component/CustomBottomNavBar.dart';

class SolarDetailsScreen extends StatefulWidget {
  const SolarDetailsScreen({super.key});

  @override
  State<SolarDetailsScreen> createState() => _SolarDetailsScreenState();
}

class _SolarDetailsScreenState extends State<SolarDetailsScreen> {
  final modelController = TextEditingController();
  final capacityController = TextEditingController();
  final meterController = TextEditingController();

  // Simule le stockage des données (à remplacer par SharedPreferences ou DB)
  String? savedModel, savedCapacity, savedMeter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/solarconndetails.jpg',
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Update Solar Details",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Champ: Solar Model
              _buildInputField(
                icon: Icons.solar_power_outlined,
                label: "Solar Model Number",
                controller: modelController,
              ),
              const SizedBox(height: 16),

              // Champ: Capacity
              _buildInputField(
                icon: Icons.flash_on_outlined,
                label: "Capacity (watts or Kilowatts)",
                controller: capacityController,
              ),
              const SizedBox(height: 16),

              // Champ: Meter Number
              _buildInputField(
                icon: Icons.confirmation_number_outlined,
                label: "Meter Number",
                controller: meterController,
              ),
              const SizedBox(height: 40),

              // Bouton Save
              Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00C853), Color(0xFF2E7D32)],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        savedModel = modelController.text;
                        savedCapacity = capacityController.text;
                        savedMeter = meterController.text;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Details saved successfully!"),
                          backgroundColor: Colors.green,
                        ),
                      );

                      print("Model: $savedModel");
                      print("Capacity: $savedCapacity");
                      print("Meter: $savedMeter");
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Save Details",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required IconData icon,
    required String label,
    required TextEditingController controller,
  }) {
    return Container(
      padding: const EdgeInsets.only(bottom: 4),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.black87),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: label,
                hintStyle: const TextStyle(fontSize: 16, color: Colors.black54),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
