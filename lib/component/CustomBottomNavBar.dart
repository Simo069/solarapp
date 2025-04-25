

import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavBar({Key? key, required this.selectedIndex})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, -17),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_icons.length, (index) {
          return _buildNavItem( context,_icons[index], index, _routes[index]);
        }),
      ),
    );
  }

  Widget _buildNavItem( BuildContext context,IconData icon, int index, String routeName) {
    final bool isSelected = selectedIndex == index;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green[700] : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey[500],
          size: isSelected ? 28 : 24,
        ),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false,);
          // Navigator.pushReplacementNamed(context, routeName).then((_) {
          //   // Optionally, you can add any action after navigating back
          // });

        },
      ),
    );
  }

  static const List<IconData> _icons = [
    Icons.home,
    Icons.bar_chart,
    Icons.credit_card,
    Icons.notifications_none,
    Icons.settings,
  ];
  static const List<String> _routes = [
    '/dashboard',
    '/StatisticsScreen',
    '/ExplorePage',
    '/Notificationscreen',
    '/settingScreen',
  ];
}
