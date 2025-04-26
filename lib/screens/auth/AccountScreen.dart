import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solarapp/component/CustomBottomNavBar.dart';

import 'package:solarapp/services/fireAuth/UserProvider.dart';

import 'package:solarapp/Models/UserModel.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({super.key});
  State<AccountScreen> createState() => _AccountScreenState();
}



class _AccountScreenState extends State<AccountScreen> {
  int _selectedIndex = 4;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    int _selectedIndex = 4;

    int calculateAge(DateTime? birthDate) {
      if (birthDate == null) return 0; // check if null first

      DateTime today = DateTime.now();
      int age = today.year - birthDate.year;

      if (today.month < birthDate.month ||
          (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }

      return age;
    }

    int age = calculateAge(user?.dateOfBirth);
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.black,
                    size: 28,
                  ),
                ),
              ),
              SizedBox(height: 8),
              // Account Details Title
              _buildProfile(user , age),
              SizedBox(height: 16),
              _buildDetails(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 4,),
    );
  }

  Widget _buildProfile(UserModel? user , int age) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(12),
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
                      child: Icon(Icons.person, size: 50, color: Colors.grey),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(Icons.camera_alt, size: 16, color: Colors.green),
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' ${user?.firstName} ${user?.lastName} ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Gender - ${user?.gender} ',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  'Age - ${age}',
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
        SizedBox(height: 12),

        // Account Options
        _buildListTile(Icons.person_outline, 'General info', '/editProfile'),
        _buildListTile(Icons.lock_outline, 'Password', '/Newpassword'),
        // _buildListTile(Icons.mail_outline, 'Contact info',),
      ],
    );
  }

  Widget _buildListTile(IconData icon, String title, String link) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black54),
          title: Text(title, style: TextStyle(color: Colors.black87)),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.black45,
          ),
          onTap: () {
            print('Tapped on $title');
            Navigator.pushNamed(context, link);
          },
        ),
        Divider(height: 1),
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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
