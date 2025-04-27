// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:solarapp/Models/InstallerProfile.dart';
// import 'package:solarapp/component/CustomBottomNavBar.dart';
// import 'package:solarapp/screens/InstallerProfileScreen.dart';

// class installerListscreen extends StatefulWidget {
//   final List<InstallerProfile> installers;
//   installerListscreen({super.key, required this.installers});
//   State<installerListscreen> createState() => _installerListscreen();
// }

// class _installerListscreen extends State<installerListscreen> {
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           SizedBox(height: 40),
//           Row(
//             children: [
//               Container(
//                 alignment: Alignment.topLeft,
//                 child: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(
//                     Icons.arrow_back_ios_new_sharp,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 // 👈 Added this
//                 child: Text(
//                   'Find and contact certified installers with',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
//                   overflow: TextOverflow.visible, // optional
//                   softWrap: true, // optional but ensures wrapping
//                 ),
//               ),
//             ],
//           ),

//           Expanded(
//             child: ListView.builder(
//               itemCount: widget.installers.length,
//               itemBuilder: (context, index) {
//                 final installer = widget.installers[index];
//                 return ListTile(
//                   leading: CircleAvatar(
//                     backgroundImage: NetworkImage(installer.imageUrl),
//                   ),
//                   title: Text(installer.name),
//                   subtitle: Text(installer.company),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder:
//                             (context) =>
//                                 InstallerProfileScreen(profile: installer),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: CustomBottomNavBar(selectedIndex: 3),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:solarapp/Models/InstallerProfile.dart';
import 'package:solarapp/component/CustomBottomNavBar.dart';
import 'package:solarapp/screens/InstallerProfileScreen.dart';

class installerListscreen extends StatefulWidget {
  final List<InstallerProfile> installers;

  const installerListscreen({super.key, required this.installers});

  @override
  State<installerListscreen> createState() => _installerListscreenState();
}

class _installerListscreenState extends State<installerListscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea( // 👈 Add SafeArea for better display on all devices
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Find and contact certified installers',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.installers.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final installer = widget.installers[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              InstallerProfileScreen(profile: installer),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 6,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                installer.imageUrl,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                  width: 80,
                                  height: 80,
                                  color: Colors.grey[300],
                                  child: Icon(Icons.error, color: Colors.red),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    installer.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    installer.company,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  if (installer.serviceArea != null) // Optional serviceArea
                                    Text(
                                      installer.serviceArea!,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 2),
    );
  }
}
