import 'package:flutter/material.dart';
import 'package:solarapp/Models/InstallerProfile.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solarapp/component/CustomBottomNavBar.dart';

class InstallerProfileScreen extends StatefulWidget {
  final InstallerProfile profile;
  InstallerProfileScreen({super.key, required this.profile});
  State<InstallerProfileScreen> createState() => _InstallerProfileScreenState();
}

class _InstallerProfileScreenState extends State<InstallerProfileScreen> {
  int _selectedIndex = 2;
  // final InstallerProfile profile = InstallerProfile(
  //   id:1.toString(),
  //   name: 'Mohammed Boukhatem',
  //   rating: 4.0,
  //   certification: 'RGE certified',
  //   company: 'SolarTech Solutions',
  //   experience: '10 years in solar panel installation',
  //   serviceArea: 'Casablanca',
  //   contact: 'mohammed.boukhatem@solartech.ma | +212 604 470 620',
  //   description:
  //       'Jean Dupont is a certified installer specializing in photovoltaic and '
  //       'thermal solar panels. He supports his clients from project planning to '
  //       'installation and maintenance. With his expertise, he ensures '
  //       'installations meet the highest standards, guaranteeing optimal '
  //       'energy production and long-term savings.',
  //   imageUrl: 'https://example.com/profile.jpg',
  //   price: 400,
  //   position: const LatLng(37.7699, -122.4960), // Replace with your image URL
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 8),
                    // Row(

                    //   children: [
                    //     Container(
                    //       alignment: Alignment.topLeft,
                    //       child: IconButton(
                    //         onPressed: () {
                    //           Navigator.pop(context);
                    //         },
                    //         icon: Icon(
                    //           Icons.arrow_back_ios_new_sharp,
                    //           color: Colors.black,
                    //         ),
                    //       ),
                    //     ),
                    //     Text(
                    //       'Find and contact certified installers with',
                    //       style: TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.w300,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_sharp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          // 👈 Added this
                          child: Text(
                            'Find and contact certified installers with',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                            overflow: TextOverflow.visible, // optional
                            softWrap: true, // optional but ensures wrapping
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          'POWER',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Monitor',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w200,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green.shade200),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Find local installers',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade400,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              InstallerProfileCard(profile: widget.profile),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 2),
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

class InstallerProfileCard extends StatelessWidget {
  final InstallerProfile profile;

  const InstallerProfileCard({Key? key, required this.profile})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile picture with green border
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.green, width: 3),
                ),
                child: ClipOval(
                  child: Image.asset(
                    profile.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback if image fails to load
                      return Container(
                        color: Colors.grey.shade200,
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.grey.shade400,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 15),
              // Installer details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Star rating
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < profile.rating.floor()
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Certification
                    Row(
                      children: [
                        Icon(Icons.trending_up, color: Colors.red),
                        const SizedBox(width: 5),
                        Text(
                          profile.certification,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    // Company
                    Row(
                      children: [
                        Icon(Icons.business, color: Colors.green),
                        const SizedBox(width: 5),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Company: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: profile.company,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    // Experience
                    Row(
                      children: [
                        Icon(Icons.engineering, color: Colors.blue.shade300),
                        const SizedBox(width: 5),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Experience: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: profile.experience,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    // Service Area
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.blue),
                        const SizedBox(width: 5),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Service Area: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: profile.serviceArea,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    // Contact
                    Row(
                      children: [
                        Icon(Icons.contact_mail, color: Colors.blue.shade200),
                        const SizedBox(width: 5),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Contact: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: profile.contact,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Description Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.green[500]!, width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Description:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(profile.description, style: const TextStyle(fontSize: 15)),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                // Add contact functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade800,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text(
                'Contact',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Or ',
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/InstallerMapScreen');
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                ),
                child: Text(
                  'click here',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                ' to see in map',
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
            ],
          ),
          // Center(
          //   child: RichText(
          //     text: TextSpan(
          //       children: [
          //         TextSpan(
          //           text: 'Or ',
          //           style: TextStyle(color: Colors.black54, fontSize: 16),
          //         ),
          //         WidgetSpan(
          //           child: ElevatedButton(
          //             onPressed: () {
          //               Navigator.pushNamed(context, '/InstallerMapScreen');
          //             },
          //             style: ElevatedButton.styleFrom(
          //               elevation: 0,
          //               padding: EdgeInsets.zero,
          //               backgroundColor: Colors.transparent,
          //             ),
          //             child: Text(
          //               'click here',
          //               style: TextStyle(
          //                 color: Colors.black87,
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //         ),
          //         TextSpan(
          //           text: ' to see in map',
          //           style: TextStyle(color: Colors.black54, fontSize: 16),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          // const SizedBox(height: 30),
        ],
      ),
    );
  }
}
