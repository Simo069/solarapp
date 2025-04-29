import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:solarapp/screens/ExplorePage.dart';
import 'package:solarapp/screens/HomeScreen.dart';
import 'package:solarapp/screens/SolarDetailsScreen.dart';
import 'package:solarapp/screens/SolarconnScreen.dart';
import 'package:solarapp/screens/StatisticsScreen.dart';
<<<<<<< HEAD
=======
import 'package:solarapp/screens/articles.dart';
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
import 'package:solarapp/screens/auth/AccountScreen.dart';
import 'package:solarapp/screens/InstallerMapScreen.dart';
import 'package:solarapp/screens/InstallerProfileScreen.dart';
import 'package:solarapp/screens/NotificationScreen.dart';
<<<<<<< HEAD
import 'package:solarapp/screens/Notification.dart';
=======
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
import 'package:solarapp/screens/auth/Newpassword.dart';
import 'package:solarapp/screens/auth/ResetPasswordScreen.dart';
import 'package:solarapp/screens/auth/createAccount.dart';
import 'package:solarapp/screens/auth/createAccountInfo.dart';
import 'package:solarapp/screens/auth/loginScreen.dart';
import 'package:solarapp/screens/auth/loginSuccessScreen.dart';
import 'package:solarapp/screens/auth/otpVerficationResetpassword.dart';
import 'package:solarapp/screens/editProfile.dart';
import 'package:solarapp/screens/settingScreen.dart';
<<<<<<< HEAD
import 'package:solarapp/screens/TermsConditionsScreen.dart';
import 'package:solarapp/screens/PrivacyPolicyScreen.dart';
import 'package:solarapp/screens/AboutUsScreen.dart';
=======
import 'package:solarapp/screens/solarDetailScreenParameter.dart';
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
import 'package:solarapp/services/fireAuth/UserProvider.dart';
import 'package:solarapp/screens/solardashboard.dart';
import 'package:solarapp/screens/auth/OTPVerificationScreen.dart';

<<<<<<< HEAD
=======

>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
<<<<<<< HEAD
  if (kIsWeb) {
=======
  if(kIsWeb){
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
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
<<<<<<< HEAD
  } else {
=======
  }else{
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
    await Firebase.initializeApp();
  }
  runApp(
    MultiProvider(
<<<<<<< HEAD
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
=======
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
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
<<<<<<< HEAD

=======
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
      // home: solardashboard(),
      // home:InstallerProfileScreen(),
      // home: InstallerMapScreen(),
      // home: AccountScreen(),
      // home: settingScreen(),
      // home: editProfile(),
<<<<<<< HEAD
      // home: Notifications(),
=======
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
      // home: Notificationscreen(),
      // home: Newpassword(),
      // home: loginScreen(),
      // home : loginSuccessScreen(),
      // home: createAccount(),
      // home:createAccountInfo(),
      // home: OTPVerificationScreen(),
      // home:ResetPasswordscreen(),
<<<<<<< HEAD
      initialRoute: '/',
      routes: {
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
        '/TermsConditionsScreen': (context) => TermsConditionsScreen(),
        '/PrivacyPolicyScreen': (context) => PrivacyPolicyScreen(),
        '/AboutUsScreen': (context) => AboutUsScreen(),
        '/editProfile': (context) => editProfile(),
        '/Notifications': (context) => Notifications(),

=======

      initialRoute: '/',
      routes:{
        // '/' : (context) => article(),
        '/': (context) => HomeScreen(),
        '/ExplorePage': (context) =>  ExplorePage(),
        '/StatisticsScreen': (context) =>  StatisticsScreen(),
        '/SolarconnScreen': (context) =>  SolarconnScreen(),
        '/SolarDetailsScreen': (context) =>  SolarDetailsScreen(),
        

        '/loginScreen': (context) => loginScreen(),
        '/dashboard': (context) => solardashboard(),
        // '/InstallerProfileScreen': (context) => InstallerProfileScreen(),
        '/InstallerMapScreen': (context) => InstallerMapScreen(),
        '/AccountScreen': (context) => AccountScreen(),
        '/settingScreen': (context) => settingScreen(),
        '/editProfile': (context) => editProfile(),
        '/Notificationscreen': (context) => Notificationscreen(),
        '/solarDetailscreenparameter':(context) => solarDetailscreenparameter() ,
  
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
        '/loginSuccessScreen': (context) => loginSuccessScreen(),
        '/createAccount': (context) => createAccount(),
        '/createAccountInfo': (context) => createAccountInfo(),
        '/OTPVerificationScreen': (context) => OTPVerificationScreen(),
        '/ResetPasswordscreen': (context) => ResetPasswordscreen(),
        // '/otpVerficationResetpassword' : (context) => otpVerficationResetpassword(),
        '/Newpassword': (context) => Newpassword(),
<<<<<<< HEAD
      },

      // home: const ExplorePage(),
      // home: const StatisticsScreen(),
      // home: const SolarconnScreen(),
      // home: HomeScreen(),
      // home: const SolarDetailsScreen(),
=======
        // '/article' : (context) => article(),
      },

    

      
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
    );
  }
}
