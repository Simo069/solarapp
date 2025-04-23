import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({super.key});
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _selectedIndex = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: const BackButton(color: Colors.black),
      //   title: const Text(
      //     'Account',
      //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,

      // ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Text(
            '<',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Account Details Title
              _buildProfile(),
              const SizedBox(height: 16),
              _buildDetails(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildProfile() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green[800],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/installer3.jpg', // replace with your local asset
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey.shade300,
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 16,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Omar Badale',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Gender - male',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  'Age - 66 year',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetails() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Account Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Account Options
        _buildListTile(Icons.person_outline, 'General info'),
        _buildListTile(Icons.lock_outline, 'Password'),
        _buildListTile(Icons.mail_outline, 'Contact info'),
      ],
    );
  }

  Widget _buildListTile(IconData icon, String title) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black54),
          title: Text(title, style: const TextStyle(color: Colors.black87)),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.black45,
          ),
          onTap: () {
            print('Tapped on $title');
          },
        ),
        const Divider(height: 1),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),

        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0, -17),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _bottomNavItem(Icons.home, 0),
          _bottomNavItem(Icons.bar_chart, 1),
          _bottomNavItem(Icons.credit_card, 2),
          _bottomNavItem(Icons.notifications_none, 3),
          _bottomNavItem(Icons.settings, 4),
        ],
      ),
    );
  }

  Widget _bottomNavItem(IconData icon, int index) {
    final bool isSelected = _selectedIndex == index;

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
          setState(() {
            _selectedIndex = index;
          });
          // Optionally, add navigation logic here
        },
      ),
    );
  }
}
