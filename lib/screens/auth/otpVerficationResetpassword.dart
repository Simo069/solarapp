import 'dart:async';

import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';
import 'package:solarapp/screens/auth/Newpassword.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:solarapp/services/fireAuth/firebaseAuthServices.dart';

class otpVerficationResetpassword extends StatefulWidget {
  late final String email;
  late final EmailOTP? myAuth;

  otpVerficationResetpassword({super.key, this.myAuth, required this.email});
  @override
  _otpVerficationResetpasswordState createState() =>
      _otpVerficationResetpasswordState();
}

class _otpVerficationResetpasswordState
    extends State<otpVerficationResetpassword> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final authService = Firebaseauthservices();

  bool isLoading = false;
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
    setState(() {
      isLoading = true; // Start loading indicator
    });

    // Verify OTP
    bool isValid = await widget.myAuth?.verifyOTP(otp: _otpController.text.trim());

    if (isValid) {
      // OTP is valid, send reset password email
      bool isEmailSend = await authService.resetPasswordByEmail(email: widget.email);

      if (isEmailSend) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("You received an email to reset your password."),
            backgroundColor: Colors.green,
            elevation: 6,
            duration: Duration(seconds: 3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          ),
        );

        // Navigate to login screen
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/loginScreen',
          (route) => false,
        );
      } else {
        // Email sending failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Please try again."),
            backgroundColor: Colors.red,
            elevation: 6,
            duration: Duration(seconds: 3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          ),
        );
      }
    } else {
      // OTP is invalid
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid OTP."),
          backgroundColor: Colors.red,
          elevation: 6,
          duration: Duration(seconds: 3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        ),
      );
    }

    // Stop loading indicator
    setState(() {
      isLoading = false;
    });
  }
}


  void _resendCode() {
    setState(() {
      _start = 180;
      _canResend = false;
    });
    _startTimer();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Verification code resent!"),
        backgroundColor: Colors.orange,
        behavior: SnackBarBehavior.floating,
        elevation: 6,
        duration: Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _otpController.dispose();
    super.dispose();
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
              isLoading
                  ? Center(child: CircularProgressIndicator())
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
                          SizedBox(width: 8),
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
                                // if (value != '12345') {
                                //   return 'Invalid verification code';
                                // }
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
                                "Verify and Reset Password",
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
