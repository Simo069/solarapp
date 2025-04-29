import 'package:flutter/material.dart';
import 'package:solarapp/component/CustomBottomNavBar.dart';
<<<<<<< HEAD
=======
import 'package:solarapp/components/bottomNavBar.dart';
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee

class Notificationscreen extends StatefulWidget {
  const Notificationscreen({Key? key}) : super(key: key);

  @override
  State<Notificationscreen> createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {
<<<<<<< HEAD
=======
  int _selectedIndex = 3;
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
  Map<String, bool> notifications = {
    'Charging Issues': false,
    'Inverter Issues': true,
    'Weather Forecast': true,
    'Energy Saving Suggestion': true,
    'Charging Updates': false,
    'Connection Help': true,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Push Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
=======
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: Text('Push Notifications' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.grey[800]),),
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        itemBuilder: (context, index) {
          String key = notifications.keys.elementAt(index);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(key, style: TextStyle(fontSize: 18, color: Colors.black)),
              Switch(
                value: notifications[key]!,
                onChanged: (bool value) {
                  setState(() {
                    notifications[key] = value;
                  });
                },
                activeColor: Colors.white,
                activeTrackColor: Colors.green,
              ),
            ],
          );
        },
<<<<<<< HEAD
        separatorBuilder: (context, index) => Divider(),
        itemCount: notifications.length,
      ),

      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 3),
=======
        separatorBuilder: (context, index)=> Divider(),
        itemCount: notifications.length,
      ),


      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 3,),
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
    );
  }
}
