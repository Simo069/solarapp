import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solarapp/Models/InstallerProfile.dart';
import 'package:solarapp/Models/articleModel.dart';
import 'package:solarapp/screens/InstallerProfileScreen.dart';
import 'package:solarapp/screens/articles.dart';
import 'package:solarapp/screens/installerListscreen.dart';
import '/component/CustomBottomNavBar.dart';

import 'package:url_launcher/url_launcher.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});
  // final List<InstallerProfile> installers = [
  //   InstallerProfile(
  //     id: '1',
  //     name: 'Mohammed Boukhatem',
  //     rating: 4.0,
  //     certification: 'RGE certified',
  //     company: 'SolarTech Solutions',
  //     experience: '10 years in solar panel installation',
  //     serviceArea: 'Casablanca',
  //     contact: 'mohammed.boukhatem@solartech.ma | +212 604 470 620',
  //     description:
  //         'Mohammed is a certified installer specializing in solar panels.',
  //     imageUrl: 'assets/images/installer1.jpeg',
  //     price: 400,
  //     position: LatLng(37.7699, -122.4960),
  //   ),
  //   // Ajoute d'autres installateurs ici
  // ];
  final List<InstallerProfile> installers = [
    InstallerProfile(
      id: '1',
      name: 'Mohammed Boukhatem',
      rating: 4.0,
      certification: 'RGE certified',
      company: 'SolarTech Solutions',
      experience: '10 years in solar panel installation',
      serviceArea: 'Casablanca',
      contact: 'mohammed.boukhatem@solartech.ma | +212 604 470 620',
      description:
          'Mohammed is a certified installer specializing in solar panels.',
      imageUrl: 'assets/images/installer1.jpeg',
      price: 400,
      position: LatLng(37.7699, -122.4960),
    ),
    InstallerProfile(
      id: '2',
      name: 'Omar Badale',
      rating: 4.5,
      certification: 'Certified by SolarTech',
      company: 'EcoSolar',
      experience: '8 years in the solar installation industry',
      serviceArea: 'Rabat',
      contact: 'omar.badale@ecosolar.ma | +212 674 123 456',
      description:
          'Omar is an expert in solar installations with a focus on sustainable energy solutions.',
      imageUrl: 'assets/images/installer2.jpeg',
      price: 350,
      position: LatLng(34.0206, -6.8417),
    ),
    InstallerProfile(
      id: '3',
      name: 'Hiba Bity',
      rating: 4.7,
      certification: 'Certified Solar Installer',
      company: 'Green Energy',
      experience: '5 years in solar energy systems installation',
      serviceArea: 'Marrakech',
      contact: 'hiba.bity@greenenergy.ma | +212 602 345 678',
      description:
          'Hiba specializes in installing solar panels and energy-efficient systems.',
      imageUrl: 'assets/images/installer1.jpeg',
      price: 420,
      position: LatLng(31.6295, -7.9811),
    ),
    InstallerProfile(
      id: '4',
      name: 'Malak Zahid',
      rating: 3,
      certification: 'Certified by SolarPro',
      company: 'SunPower',
      experience: '6 years in solar panel installations',
      serviceArea: 'Fes',
      contact: 'malak.zahid@sunpower.ma | +212 612 478 901',
      description:
          'Malak is passionate about solar energy and has worked on numerous commercial and residential projects.',
      imageUrl: 'assets/images/installer2.jpeg',
      price: 460,
      position: LatLng(34.0382, -5.0022),
    ),
    // Ajoute d'autres installateurs si nécessaire
  ];

  // final List<Map<String, String>> articles = [
  //   {
  //     "title": "How Solar Panels Work",
  //     "description": "Learn the basics of solar energy and how it powers your home.",
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

  final List<articleModel> articlesData = [
    articleModel(
      id: '1',
      name: "How Solar Panels Work",
      description:
          "Learn the basics of solar energy and how it powers your home.",
      imageUrl: "assets/images/articles/article1.jpeg",
      url: "https://youtu.be/XZmx1OSdMIQ?si=Ghh7OPfj9aM9B53A",
    ),
    articleModel(
      id: '2',
      name: "Top Solar Installers in 2025",
      description: "A review of the best solar panel installers this year.",
      imageUrl: "assets/images/articles/article2.jpeg",
      url: "https://youtu.be/oDIrCr62FRU?si=89dBgCemSvJZAAnO",
    ),
    articleModel(
      id: '3',
      name: "Best Solar Solutions",
      description: "Choosing the right solar solution for your needs.",
      imageUrl: "assets/images/articles/article3.jpeg",

      url: "https://youtu.be/XZmx1OSdMIQ?si=Ghh7OPfj9aM9B53A",
    ),
    articleModel(
      id: '4',
      name: "Solar Energy Trends 2025",
      description: "What's new and upcoming in the solar industry.",
      imageUrl: "assets/images/articles/article4.jpeg",
      url: "https://youtu.be/oDIrCr62FRU?si=89dBgCemSvJZAAnO",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Explore",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  "POWERMonitor",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 12),
                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 248, 238),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Color.fromARGB(255, 198, 235, 184),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Find things to do",
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Title + See all
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Why Go Solar with SolarSavy?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide.none,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => article(articles: articlesData),
                          ),
                        );
                      },
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                // Cards with images and text
                // SizedBox(
                //   height: 210,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: [
                //       buildCard(
                //         articlesData[0]
                //       ),
                //       SizedBox(width: 12),
                //       buildCard(
                //        articlesData[1]      ),
                //       SizedBox(width: 12),
                //       buildCard(
                //         articlesData[2]                  ),
                //       SizedBox(width: 12),
                //       buildCard(
                //         articlesData[3]     ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        articlesData.length, // Corrected to use articlesData
                    itemBuilder: (context, index) {
                      articleModel article = articlesData[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: buildCard(context, article),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Find certified installers",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide.none,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    installerListscreen(installers: installers),
                          ),
                        );
                      },
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),

                // SizedBox(
                //   height: 400,
                //   // child: ListView(
                //   //   scrollDirection: Axis.horizontal,
                //   //   children: [
                //   //     buildCard(
                //   //       "assets/images/installer1.jpg",
                //   //       "Decrease your carbon footprint and contribute to a more sustainable future.",
                //   //     ),
                //   //      SizedBox(width: 12),
                //   //     buildCard(
                //   //       "assets/images/installer2.jpg",
                //   //       "Decrease your carbon footprint and contribute to a more sustainable future.",
                //   //     ),
                //   //      SizedBox(width: 12),
                //   //     buildCard(
                //   //       "assets/images/installer3.jpg",
                //   //       "Connect with pre-vetted local professionals who meet our quality standards.",
                //   //     ),
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 4,
                //     itemBuilder: (context , index){

                //     InstallerProfile profile = installers[index];
                //     return buildCard(profile.imageUrl, profile.description);
                //   }),

                // ),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: installers.length, // Corrected to use installers
                    itemBuilder: (context, index) {
                      InstallerProfile profile = installers[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: buildCardInstaller(context, profile),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget buildCard(BuildContext context, articleModel article) {
    return GestureDetector(
      onTap: () async {
        final url = article.url;
        if (url != null && await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
        } else {
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
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Container(
            //   height: 100,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     borderRadius:  BorderRadius.only(
            //       topLeft: Radius.circular(12),
            //       topRight: Radius.circular(12),
            //     ),
            //     image: DecorationImage(
            //       image: AssetImage(imagePath),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Image.asset(
              "${article.imageUrl}",
              height: 140,
              width: 180,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                article.description,
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardInstaller(BuildContext context, InstallerProfile profile) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InstallerProfileScreen(profile: profile),
          ),
        );
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Container(
            //   height: 100,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     borderRadius:  BorderRadius.only(
            //       topLeft: Radius.circular(12),
            //       topRight: Radius.circular(12),
            //     ),
            //     image: DecorationImage(
            //       image: AssetImage(imagePath),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Image.asset(
              profile.imageUrl,
              height: 140,
              width: 180,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                profile.description,
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
