

import 'package:flutter/material.dart';
import '/component/CustomBottomNavBar.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Explore",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const Text(
                  "POWERMonitor",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 241, 248, 238),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: const Color.fromARGB(255, 198, 235, 184),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Find things to do",
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Title + See all
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Why Go Solar with SolarSavy?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Cards with images and text
                SizedBox(
                  height: 210,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildCard(
                        "assets/images/eco_lightbulb.jpg",
                        "Decrease your carbon footprint and contribute to a more sustainable future.",
                      ),
                      const SizedBox(width: 12),
                      buildCard(
                        "assets/images/solar_worker.jpg",
                        "Decrease your carbon footprint and contribute to a more sustainable future.",
                      ),
                      const SizedBox(width: 12),
                      buildCard(
                        "assets/images/eco_lightbulb.jpg",
                        "Connect with pre-vetted local professionals who meet our quality standards.",
                      ),
                      const SizedBox(width: 12),
                      buildCard(
                        "assets/images/solar_worker.jpg",
                        "Connect with pre-vetted local professionals who meet our quality standards.",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Find certified installers",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 210,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildCard(
                        "assets/images/installer1.jpg",
                        "Decrease your carbon footprint and contribute to a more sustainable future.",
                      ),
                      const SizedBox(width: 12),
                      buildCard(
                        "assets/images/installer2.jpg",
                        "Decrease your carbon footprint and contribute to a more sustainable future.",
                      ),
                      const SizedBox(width: 12),
                      buildCard(
                        "assets/images/installer3.jpg",
                        "Connect with pre-vetted local professionals who meet our quality standards.",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget buildCard(String imagePath, String description) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
