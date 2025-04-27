// import 'package:flutter/material.dart';
// import 'package:solarapp/component/CustomBottomNavBar.dart';
// import 'package:url_launcher/url_launcher.dart';

// class article extends StatefulWidget {
//   State<article> createState() => _articleState();
// }

// class _articleState extends State<article> {
//   final List<Map<String, String>> articles = [
//     {
//       "title": "How Solar Panels Work",
//       "description":
//           "Learn the basics of solar energy and how it powers your home.",
//       "image": "assets/images/eco_lightbulb.jpg",
//       "url": "https://youtu.be/XZmx1OSdMIQ?si=Ghh7OPfj9aM9B53A",
//     },
//     {
//       "title": "Top Solar Installers in 2025",
//       "description": "A review of the best solar panel installers this year.",
//       "image": "assets/images/eco_lightbulb.jpg",
//       "url": "https://youtu.be/oDIrCr62FRU?si=89dBgCemSvJZAAnO",
//     },
//     {
//       "title": "Top Solar Installers in 2025",
//       "description": "A review of the best solar panel installers this year.",
//       "image": "assets/images/eco_lightbulb.jpg",
//       "url": "https://youtu.be/oDIrCr62FRU?si=89dBgCemSvJZAAnO",
//     },
//     {
//       "title": "Top Solar Installers in 202",
//       "description": "A review of the best solar panel installers this year.",
//       "image": "assets/images/eco_lightbulb.jpg",
//       "url": "https://youtu.be/oDIrCr62FRU?si=89dBgCemSvJZAAnO",
//     },
//     // Ajoute d'autres articles ici
//   ];
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             SizedBox(height: 40),
//             Row(
//               children: [
//                 Container(
//                   alignment: Alignment.topLeft,
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black),
//                   ),
//                 ),
//                 Text("Why go with PowerMonitor " , style: TextStyle(color: Colors.black , fontSize: 22 , fontWeight: FontWeight.bold),),
//               ],
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 padding: EdgeInsets.all(16),
//                 itemCount: articles.length,
//                 itemBuilder: (context, index) {
//                   final article = articles[index];
//                   return GestureDetector(
//                     // onTap: () async {
//                     //   final url = article['url'];
//                     //   if (url != null && await canLaunchUrl(Uri.parse(url))) {
//                     //     await launchUrl(Uri.parse(url));
//                     //   } else {
//                     //     ScaffoldMessenger.of(context).showSnackBar(
//                     //       SnackBar(content: Text('Could not open the link')),
//                     //     );
//                     //   }
//                     // },
//                     onTap: () async {
//                       final url = article['url'];
//                       if (url != null) {
//                         await launchUrl(
//                           Uri.parse(url),
//                           mode: LaunchMode.externalApplication,
//                         );
//                       }
//                     },
//                     child: Card(
//                       margin: EdgeInsets.only(bottom: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       elevation: 5,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.vertical(
//                               top: Radius.circular(20),
//                             ),
//                             child: Image.asset(
//                               article['image'] ?? '',
//                               width: double.infinity,
//                               height: 180,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   article['title'] ?? '',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(height: 8),
//                                 Text(
//                                   article['description'] ?? '',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.grey[700],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: CustomBottomNavBar(selectedIndex: 2),

//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:solarapp/Models/articleModel.dart';
import 'package:solarapp/component/CustomBottomNavBar.dart';
import 'package:url_launcher/url_launcher.dart';

class article extends StatefulWidget {
  final List<articleModel> articles;
  article({super.key, required this.articles});
  @override
  State<article> createState() => _articleState();
}

class _articleState extends State<article> {
  // final List<Map<String, String>> articles = [
  //   {
  //     "title": "How Solar Panels Work",
  //     "description":
  //         "Learn the basics of solar energy and how it powers your home.",
  //     "image": "assets/images/eco_lightbulb.jpg",
  //     "url": "https://youtu.be/XZmx1OSdMIQ?si=Ghh7OPfj9aM9B53A",
  //   },
  //   {
  //     "title": "Top Solar Installers in 2025",
  //     "description": "A review of the best solar panel installers this year.",
  //     "image": "assets/images/eco_lightbulb.jpg",
  //     "url": "https://youtu.be/oDIrCr62FRU?si=89dBgCemSvJZAAnO",
  //   },
  //   {
  //     "title": "Best Solar Solutions",
  //     "description": "Choosing the right solar solution for your needs.",
  //     "image": "assets/images/eco_lightbulb.jpg",
  //     "url": "https://youtu.be/oDIrCr62FRU?si=89dBgCemSvJZAAnO",
  //   },
  //   {
  //     "title": "Solar Energy Trends 2025",
  //     "description": "What's new and upcoming in the solar industry.",
  //     "image": "assets/images/eco_lightbulb.jpg",
  //     "url": "https://youtu.be/oDIrCr62FRU?si=89dBgCemSvJZAAnO",
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
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
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Why go with PowerMonitor?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ...widget.articles.map(
              (article) => GestureDetector(
                onTap: () async {
                  final url = article.url;
                  if (url != null && await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(
                      Uri.parse(url),
                      mode: LaunchMode.externalApplication,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Could not open the link') ,
                      elevation: 6,
                      margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(20),
                        side: BorderSide.none,

                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                // 
                child: Card(
                  margin: EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        child: Image.asset(
                          article.imageUrl ?? '',
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article.name ?? '',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              article.description ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 2),
    );
  }
}

void _showErrorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Could not open the link'),
      elevation: 6,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide.none,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
    ),
  );
}
