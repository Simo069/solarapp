import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:solarapp/screens/ExplorePage.dart';
import 'package:solarapp/screens/HomeScreen.dart';
import 'package:solarapp/screens/SolarDetailsScreen.dart';
import 'package:solarapp/screens/SolarconnScreen.dart';
import 'package:solarapp/screens/StatisticsScreen.dart';
import 'package:solarapp/screens/auth/AccountScreen.dart';
import 'package:solarapp/screens/InstallerMapScreen.dart';
import 'package:solarapp/screens/InstallerProfileScreen.dart';
import 'package:solarapp/screens/NotificationScreen.dart';
import 'package:solarapp/screens/auth/Newpassword.dart';
import 'package:solarapp/screens/auth/ResetPasswordScreen.dart';
import 'package:solarapp/screens/auth/createAccount.dart';
import 'package:solarapp/screens/auth/createAccountInfo.dart';
import 'package:solarapp/screens/auth/loginScreen.dart';
import 'package:solarapp/screens/auth/loginSuccessScreen.dart';
import 'package:solarapp/screens/auth/otpVerficationResetpassword.dart';
import 'package:solarapp/screens/editProfile.dart';
import 'package:solarapp/screens/settingScreen.dart';
import 'package:solarapp/services/fireAuth/UserProvider.dart';
import 'package:solarapp/screens/solardashboard.dart';
import 'package:solarapp/screens/auth/OTPVerificationScreen.dart';


import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBECGU9l5JBNrqIYHctTnxB1r2sqMCj6GA",
        // authDomain: "solarapp-12345.firebaseapp.com",
        projectId: "solarapp-1e8ca",
        // storageBucket: "solarapp-12345.appspot.com",
        messagingSenderId: "428339605589",
        appId: "1:428339605589:web:41e226138118cf130664dc",
      ),
    );
  }else{
    await Firebase.initializeApp();
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      // home: solardashboard(),
      // home:InstallerProfileScreen(),
      // home: InstallerMapScreen(),
      // home: AccountScreen(),
      // home: settingScreen(),
      // home: editProfile(),
      // home: Notificationscreen(),
      // home: Newpassword(),
      // home: loginScreen(),
      // home : loginSuccessScreen(),
      // home: createAccount(),
      // home:createAccountInfo(),
      // home: OTPVerificationScreen(),
      // home:ResetPasswordscreen(),

      initialRoute: '/',
      routes:{
        '/': (context) => const HomeScreen(),
        '/ExplorePage': (context) => const ExplorePage(),
        '/StatisticsScreen': (context) => const StatisticsScreen(),
        '/SolarconnScreen': (context) => const SolarconnScreen(),
        '/SolarDetailsScreen': (context) => const SolarDetailsScreen(),
        

        '/loginScreen': (context) => loginScreen(),
        '/dashboard': (context) => solardashboard(),
        '/InstallerProfileScreen': (context) => InstallerProfileScreen(),
        '/InstallerMapScreen': (context) => InstallerMapScreen(),
        '/AccountScreen': (context) => AccountScreen(),
        '/settingScreen': (context) => settingScreen(),
        '/editProfile': (context) => editProfile(),
        '/Notificationscreen': (context) => Notificationscreen(),
        
  
        '/loginSuccessScreen': (context) => loginSuccessScreen(),
        '/createAccount': (context) => createAccount(),
        '/createAccountInfo': (context) => createAccountInfo(),
        '/OTPVerificationScreen': (context) => OTPVerificationScreen(),
        '/ResetPasswordscreen': (context) => ResetPasswordscreen(),
        '/otpVerficationResetpassword' : (context) => otpVerficationResetpassword(),
        '/Newpassword': (context) => Newpassword(),
      },

      // home: const ExplorePage(),
      // home: const StatisticsScreen(),
      // home: const SolarconnScreen(),
      // home: HomeScreen(),
      // home: const SolarDetailsScreen(),

      
    );
  }
}
