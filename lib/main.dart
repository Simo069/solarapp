import 'package:flutter/material.dart';
import 'StatisticsScreen.dart';
import 'ExplorePage.dart';
import 'SolarconnScreen.dart';
import 'HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const ExplorePage(),
      home: const StatisticsScreen(),
      // home: const SolarconnScreen(),
      // home: const HomeScreen(),
    );
  }
}
