import 'package:flutter/material.dart';
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
import 'package:solarapp/solardashboard.dart';
import 'package:solarapp/screens/auth/OTPVerificationScreen.dart';

void main() {
  runApp(MyApp());
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
      initialRoute: '/loginScreen',
      routes:{
        '/loginScreen': (context) => loginScreen(),
        '/dashboard': (context) => solardashboard(),
        '/InstallerProfileScreen': (context) => InstallerProfileScreen(),
        '/InstallerMapScreen': (context) => InstallerMapScreen(),
        '/AccountScreen': (context) => AccountScreen(),
        '/settingScreen': (context) => settingScreen(),
        '/editProfile': (context) => editProfile(),
        '/Notificationscreen': (context) => Notificationscreen(),
        
        // '/loginScreen': (context) => loginScreen(),
        '/loginSuccessScreen': (context) => loginSuccessScreen(),
        '/createAccount': (context) => createAccount(),
        '/createAccountInfo': (context) => createAccountInfo(),
        '/OTPVerificationScreen': (context) => OTPVerificationScreen(),
        '/ResetPasswordscreen': (context) => ResetPasswordscreen(),
        '/otpVerficationResetpassword' : (context) => otpVerficationResetpassword(),
        '/Newpassword': (context) => Newpassword(),
      },

      
    );
  }
}
