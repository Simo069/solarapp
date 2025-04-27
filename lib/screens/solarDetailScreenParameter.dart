import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:solarapp/component/CustomBottomNavBar.dart';

class solarDetailscreenparameter extends StatefulWidget {
  solarDetailscreenparameter({super.key});
  State<solarDetailscreenparameter> createState() =>
      _solarDetailscreenparameterState();
}

class _solarDetailscreenparameterState
    extends State<solarDetailscreenparameter> {
  bool isConnected = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Solar details",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 70),
                height: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: ListView(
                  children: [
                    isConnected
                        ? _buildConnectedSolar()
                        : _buildConnectToSolar(),
                    //isConnected ? _buildConnectedSolar() : _buildNotConnected(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 4),
    );
  }

  Widget _buildConnectedSolar() {
    return Column(
      children: [
        SizedBox(height: 30),
        Row(
          children: [
            Image.asset(
              'assets/images/solarDetail.jpeg',
              width: 50,
              height: 50,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "My Solar Panel",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Switch(
              value: isConnected,
              onChanged: (value) {
                setState(() {
                  isConnected = value;
                });
              },
              activeColor: Colors.green,
            ),
          ],
        ),
        SizedBox(height: 90),
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/secondsolar.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Alphasun 320W",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Casablanca , Morocco",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Connected",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.green[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Serila Number",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "#SN-4582-AZ",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/firstsolar.png',
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "5.2 kWh/day",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.green[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Battery Level :",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "78%",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Last Sync :",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Today at 11.45 AM ",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildConnectToSolar() {
    return Column(
      children: [
        SizedBox(height: 30),
        Row(
          children: [
            Image.asset(
              'assets/images/solarDetail.jpeg',
              width: 50,
              height: 50,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "My Solar Panel",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Switch(
              value: isConnected,
              onChanged: (value) {
                setState(() {
                  isConnected = value;
                });
              },
              activeColor: Colors.green,
            ),
          ],
        ),
        SizedBox(height: 90),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/connectedsolar.jpeg",
              width: 180,
              height: 180,
            ),
            SizedBox(height: 20),
            Text(
              "No data found!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Please connect your solar system to check the status here.",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[900],
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                ),
                onPressed: () {},
                child: Text(
                  "Connect Solar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNotConnected() {
    return Column(
      children: [
        SizedBox(height: 30),
        Row(
          children: [
            Image.asset(
              'assets/images/solarDetail.jpeg',
              width: 50,
              height: 50,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "My Solar Panel",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Switch(
              value: isConnected,
              onChanged: (value) {
                setState(() {
                  isConnected = value;
                });
              },
              activeColor: Colors.green,
            ),
          ],
        ),
        SizedBox(height: 90),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/notconnected.jpeg",
              width: 180,
              height: 180,
            ),
            SizedBox(height: 20),
            Text(
              "No data found!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Please connect your solar system to check the status here.",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(height: 20),
            // Container(
            //   width: 300,
            //   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            //   decoration: BoxDecoration(
            //     color: Colors.grey[500],
            //     borderRadius: BorderRadius.circular(30),
            //   ),
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.grey,
            //       padding: EdgeInsets.symmetric(horizontal: 50)
            //     ),
            //     onPressed: () {},
            //     child: Text(
            //       "Connect solar",
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 20,
            //         fontWeight: FontWeight.w500,
            //         letterSpacing: 1,
            //       ),
            //     ),
            //   ),
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              ),
              onPressed: () {
                print("not connected solar");
              },
              child: Text(
                "Connect solar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
