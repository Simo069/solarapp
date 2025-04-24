import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, String>> _slides = [
    {
      'title': 'Illuminate your\nWorld with solar energy',
      'image': 'assets/images/slide1.JPG',
    },
    {
      'title': 'Reduce your\nElectricity bills',
      'image': 'assets/images/slide2.JPG',
    },
    {
      'title': 'Power the Sun\nPreserve the Earth !',
      'image': 'assets/images/slide3.JPG',
    },
    {
      'title':
          'Smart Solar Monitoring\nEmpowering Your Home,\nProtecting Your Energy',
      'image': 'assets/images/slide3.JPG',
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _slides.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _goToNextScreen() {
    // TODO: Naviguer vers la prochaine page
    print("Go to next screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _slides.length,
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // Background image
              Image.asset(_slides[index]['image']!, fit: BoxFit.cover),

              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  ),
                ),
              ),

              // Foreground content
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo stylisé
                    Text(
                      'SolarSavy',
                      style: GoogleFonts.pacifico(
                        textStyle: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Titre de la slide
                    Text(
                      _slides[index]['title']!,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const Spacer(),

                    // Flèche pour continuer
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: _goToNextScreen,
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//   late Timer _timer;

//   final List<Map<String, String>> _slides = [
//     {
//       'title': 'Illuminate your\nWorld with solar energy',
//       'image': 'assets/images/solar_house.jpg',
//     },
//     {
//       'title': 'Reduce your\nElectricity bills',
//       'image': 'assets/images/save_money.jpg',
//     },
//     {
//       'title': 'Preserve the Earth !\nPower the Sun',
//       'image': 'assets/images/hand_globe.jpg',
//     },
//     {
//       'title': 'Empowering Your Home,\nProtecting Your Energy',
//       'image': 'assets/images/smart_monitoring.jpg',
//     },
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
//       if (_currentPage < _slides.length - 1) {
//         _currentPage++;
//       } else {
//         _currentPage = 0;
//       }
//       _pageController.animateToPage(
//         _currentPage,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//         controller: _pageController,
//         itemCount: _slides.length,
//         physics: const NeverScrollableScrollPhysics(), // for auto-slide only
//         itemBuilder: (context, index) {
//           return Stack(
//             fit: StackFit.expand,
//             children: [
//               // Background Image
//               Image.asset(_slides[index]['image']!, fit: BoxFit.cover),

//               // Overlay with content
//               SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 24.0,
//                     vertical: 20,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Logo
//                       Text(
//                         'SolarSavy',
//                         style: TextStyle(
//                           fontSize: 32,
//                           fontWeight: FontWeight.w900,
//                           fontStyle: FontStyle.italic,
//                           color: Colors.black87,
//                           fontFamily: 'Georgia',
//                         ),
//                       ),

//                       const SizedBox(height: 24),

//                       // Title Box
//                       Container(
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: Colors.black.withOpacity(0.4),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Text(
//                           _slides[index]['title']!,
//                           style: const TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),

//                       const Spacer(),

//                       // Next Arrow
//                       Align(
//                         alignment: Alignment.bottomRight,
//                         child: GestureDetector(
//                           onTap: () {
//                             // TODO: navigate to another page (e.g. Navigator.push)
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.white.withOpacity(0.8),
//                             ),
//                             child: const Icon(
//                               Icons.arrow_forward,
//                               size: 28,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
