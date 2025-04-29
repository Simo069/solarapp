import 'package:flutter/material.dart';

class bottomNavBar extends StatefulWidget {
  final int currentIndex;
  // final ValueChanged<int> onTap;
  // bottomNavBar({super.key, required this.currentIndex, required this.onTap});
    bottomNavBar({super.key, required this.currentIndex});

  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
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
          return _bottomNavItem(_icons[index], index);
        }),
      ),
    );
  }

  final List<IconData> _icons = [
    Icons.home,
    Icons.bar_chart,
    Icons.credit_card,
    Icons.notifications_none,
    Icons.settings,
  ];

  Widget _bottomNavItem(IconData icon, int index) {
    final bool isSelected = widget.currentIndex == index;

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
          // widget.onTap(index);
          // setState:
          // () {
          //   widget.onTap(index);
          // };
        },
      ),
    );
  }
}
