// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//   Timer? _timer;

//   final List<Map<String, String>> _slides = [
//     {
//       'title': 'Illuminate your\nWorld with solar energy',
//       'image': 'assets/images/slide1.jpg',
//     },
//     {
//       'title': 'Reduce your\nElectricity bills',
//       'image': 'assets/images/slide2.jpg',
//     },
//     {
//       'title': 'Power the Sun\nPreserve the Earth !',
//       'image': 'assets/images/slide3.jpg',
//     },
//     {
//       'title':
//           'Smart Solar Monitoring\nEmpowering Your Home,\nProtecting Your Energy',
//       'image': 'assets/images/slide3.jpg',
//     },
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
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
//     _pageController.dispose();
//     _timer?.cancel();
//     super.dispose();
//   }

//   void _goToNextScreen() {
//     Navigator.pushReplacementNamed(context, '/loginScreen');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//         controller: _pageController,
//         itemCount: _slides.length,
//         itemBuilder: (context, index) {
//           return Stack(
//             fit: StackFit.expand,
//             children: [
//               // Background image
//               Image.asset(
//                 _slides[index]['image']!,
//                 fit: BoxFit.cover,
//                 width: 400,
//                 height: 400,
//               ),

//               Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                     colors: [Colors.black.withOpacity(0.6), Colors.transparent],
//                   ),
//                 ),
//               ),

//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 60, 20, 40),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'SolarSavy',
//                       style: GoogleFonts.pacifico(
//                         textStyle: const TextStyle(
//                           fontSize: 32,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     Text(
//                       _slides[index]['title']!,
//                       style: const TextStyle(
//                         fontSize: 26,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),

//                     const Spacer(),

//                     Align(
//                       alignment: Alignment.bottomRight,
//                       child: GestureDetector(
//                         onTap: _goToNextScreen,
//                         child: Container(
//                           padding: const EdgeInsets.all(14),
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.white,
//                           ),
//                           child: const Icon(
//                             Icons.arrow_forward,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

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
      'image': 'assets/images/slide1.jpg',
    },
    {
      'title': 'Reduce your\nElectricity bills',
      'image': 'assets/images/slide2.jpg',
    },
    {
      'title': 'Power the Sun\nPreserve the Earth !',
      'image': 'assets/images/slide3.jpg',
    },
    {
      'title':
          'Smart Solar Monitoring\nEmpowering Your Home,\nProtecting Your Energy',
      'image': 'assets/images/slide3.jpg',
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
    Navigator.pushReplacementNamed(context, '/loginScreen');
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
              Opacity(
                opacity: 0.7,
                child: Image.asset(_slides[index]['image']!, fit: BoxFit.cover),
              ),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.1),
                    ],
                    stops: [0.0, 0.5],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SolarSavy',
                      style: GoogleFonts.pacifico(
                        textStyle: const TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    Text(
                      _slides[index]['title']!,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.3,
                      ),
                    ),

                    const Spacer(),

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
