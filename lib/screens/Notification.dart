import 'package:flutter/material.dart';
import 'NotificationDetailScreen.dart';
import 'Notificationscreen.dart';
import 'package:solarapp/component/CustomBottomNavBar.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  int _selectedIndex = 3;
  String selectedSort = 'Newest First';

  final List<Map<String, String>> notifications = [
    {
      'title': 'Charging Problem Detected',
      'description':
          "Your solar panel hasn't charged for the past 3 hours. Please check the system or connection!",
      'time': '34 Minutes ago',
      'icon': '⚡',
    },
    {
      'title': 'Inverter Issues',
      'description': "Your inverter is experiencing a voltage irregularity.",
      'time': '15 Minutes ago',
      'icon': '🔌',
    },
    {
      'title': 'Weather Forecast',
      'description': "Expect reduced solar output due to cloudy weather!",
      'time': '52 Minutes ago',
      'icon': '☁️',
    },
    {
      'title': 'Energy Saving Suggestion',
      'description':
          "Your battery is at 90%. Shift more energy usage now to avoid grid consumption later.",
      'time': '35 Minutes ago',
      'icon': '🌱',
    },
  ];

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12),
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            ListTile(title: Text('sort by')),
            ListTile(
              title: Text('Newest First'),
              trailing:
                  selectedSort == 'Newest First'
                      ? Icon(Icons.radio_button_checked, color: Colors.green)
                      : Icon(Icons.radio_button_off),
              onTap: () {
                setState(() {
                  selectedSort = 'Newest First';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Older First'),
              trailing:
                  selectedSort == 'Older First'
                      ? Icon(Icons.radio_button_checked, color: Colors.green)
                      : Icon(Icons.radio_button_off),
              onTap: () {
                setState(() {
                  selectedSort = 'Older First';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Read Notification'),
              trailing:
                  selectedSort == 'Read Notification'
                      ? Icon(Icons.radio_button_checked, color: Colors.green)
                      : Icon(Icons.radio_button_off),
              onTap: () {
                setState(() {
                  selectedSort = 'Read Notification';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Unread Notification'),
              trailing:
                  selectedSort == 'Unread Notification'
                      ? Icon(Icons.radio_button_checked, color: Colors.green)
                      : Icon(Icons.radio_button_off),
              onTap: () {
                setState(() {
                  selectedSort = 'Unread Notification';
                });
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 12),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Première section
          Container(
            color: Colors.white,
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: Text(
                    'Notification',
                    style: TextStyle(color: Colors.black),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Notificationscreen(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: const Color.fromARGB(
                            255,
                            117,
                            188,
                            120,
                          ),
                          child: Icon(
                            Icons.notifications_active,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Deuxième section
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest notification',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: _showSortOptions,
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Sort By'),
                              SizedBox(width: 4),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Liste de notifications
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: notifications.length,
                      separatorBuilder:
                          (context, index) =>
                              Divider(color: Colors.white, thickness: 1.5),
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          leading: Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Text(
                                  notification['icon']!,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              // Point rouge
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          title: Text(
                            notification['title']!,
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4),
                              Text(notification['description']!),
                              SizedBox(height: 8),
                              Text(
                                notification['time']!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => NotificationDetailScreen(
                                      notification: notification,
                                    ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 3),
    );
  }
}
