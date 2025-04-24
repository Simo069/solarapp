import 'dart:async';

import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';
import 'package:solarapp/services/fireAuth/firebaseAuthServices.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPVerificationScreen extends StatefulWidget {
  late final String? email;
  late final String? phone;
  late final String? password;
  late final String? firstname;
  late final String? lastname;
  late final EmailOTP? myAuth;
  OTPVerificationScreen({
    Key? key,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.password,
    this.myAuth,
  }) : super(key: key);

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final authService = Firebaseauthservices();
  bool _isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Timer _timer;
  int _start = 180; // 3 minutes in seconds
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start <= 1) {
          _canResend = true;
          _timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  void _verifyOTP() async {
    if (_formKey.currentState!.validate()) {
      bool isValid = await widget.myAuth?.verifyOTP(
        otp: _otpController.text.trim(),
      );

      if (isValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("OTP Verified Successfully"),
            backgroundColor: Colors.green,
            elevation: 6,
            duration: Duration(seconds: 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
        setState(() {
          _isLoading = true;
        });
        await registerUser(context);
        setState(() {
          _isLoading = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Invalid OTP"),
            backgroundColor: Colors.red,
            elevation: 6,
            duration: Duration(seconds: 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }

      // Navigate to the next screen or create the account
      // Navigator.pushNamed(context, '/loginScreen');
      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   '/loginScreen',
      //   (route) => false,
      // );
    }
  }

  void _resendCode() async {
    setState(() {
      _start = 180;
      _canResend = false;
    });
    _startTimer();
    bool result = await widget.myAuth?.sendOTP();
    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Verification code Resent!"),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          elevation: 6,
          duration: Duration(seconds: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to resend OTP!"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          elevation: 6,
          duration: Duration(seconds: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _otpController.dispose();
    _isLoading = false;
    super.dispose();
  }

  Future<void> registerUser(BuildContext context) async {
    try {
      final result = await authService.register(
        email: widget.email!,
        password: widget.password!,
        firstname: widget.firstname!,
        lastname: widget.lastname!,
        phone: widget.phone!,
      );

      if (result == "account created") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("User registered successfully"),
            backgroundColor: Colors.green,
            elevation: 6,
            duration: Duration(seconds: 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        );
        Future.delayed(Duration(seconds: 4), () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/loginScreen',
            (route) => false,
          );
        });
      } else if (result == "This email is already in use.") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("This email is already in use."),
            backgroundColor: Colors.orange,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        );

        // Redirection vers la page de création d'infos supplémentaires
        Future.delayed(Duration(seconds: 4), () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/loginScreen',
            (route) => false,
          );
        });
      } else {
        // Pour les autres erreurs : mot de passe faible, email invalide...
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result ?? "Registration failed"),
            backgroundColor: Colors.red,
            elevation: 6,
            duration: Duration(seconds: 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        );
      }
    } catch (e) {
      print("Error in registerUser: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Unexpected error occurred"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Container(
          height: double.infinity,
          margin: EdgeInsets.only(top: 90),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child:
              _isLoading
                  ? Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Center(child: CircularProgressIndicator()),
                  )
                  : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          Image(
                            image: AssetImage('assets/images/otpconfirm.jpeg'),
                            height: 350,
                            width: double.infinity,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Confirm Your Email",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "We've sent 5 digits verification code to Hello@tyler.com",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 24),
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: _otpController,
                              keyboardType: TextInputType.number,
                              maxLength: 5,
                              decoration: InputDecoration(
                                labelText: "Enter Verification Code",
                                prefixIcon: Icon(Icons.email_outlined),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the verification code';
                                }
                                if (value.length != 5) {
                                  return 'Code must be 5 digits';
                                }
                                return null;
                              },
                            ),
                          ),
                          // SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: _canResend ? _resendCode : null,
                                child: Text(
                                  _canResend
                                      ? "Resend"
                                      : "Resend in ${_formatTime(_start)}",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[800],
                                padding: EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: () {
                                _verifyOTP();
                              },
                              child: Text(
                                "Verify and Create Account",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Need Help | FAQ | Terms Of Use",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
        ),
      ),
    );
  }
}
