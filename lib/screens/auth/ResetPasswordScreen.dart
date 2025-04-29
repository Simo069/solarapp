import 'package:flutter/material.dart';
import 'package:solarapp/screens/auth/OTPVerificationScreen.dart';
import 'package:email_otp/email_otp.dart';
import 'package:solarapp/screens/auth/otpVerficationResetpassword.dart';
import 'package:solarapp/services/fireAuth/firebaseAuthServices.dart';

class ResetPasswordscreen extends StatefulWidget {
  const ResetPasswordscreen({super.key});

  @override
  State<ResetPasswordscreen> createState() => _ResetPasswordscreenState();
}

class _ResetPasswordscreenState extends State<ResetPasswordscreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  bool _isEmailValid = false;

  bool _isLoading = false;

  final authService = Firebaseauthservices();

  final EmailOTP myAuth = EmailOTP();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _isLoading = false;
    _isEmailValid = false;
    super.dispose();
  }

  void _validateEmail() {
    String email = _emailController.text.trim();
    final isValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
    setState(() {
      _isEmailValid = isValid;
    });
  }

  void _submitEmail() async {
    String email = _emailController.text.trim();
    if (_isEmailValid) {
      setState(() {
        _isLoading = true;
      });
      bool exist = await authService.checkEmailExists(
        _emailController.text.trim(),
      );
      if (exist) {
        // Email exists, proceed with sending OTP
        _sendOTP();
      } else {
        // Email does not exist, show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Email does not exist please try with another one"),
            backgroundColor: Colors.red,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 3),
          ),
        );
        setState(() {
          _isLoading = false;
        });
        return;
      }
    } else {
      //  Invalid email — show message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter a valid email address"),
          backgroundColor: Colors.red,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void _sendOTP() async {
    myAuth.setConfig(
      appEmail: "mohammedboukhatem069@gmail.com", // Your app's email
      appName: "Solar App",
      userEmail: _emailController.text.trim(), // User's email
      otpLength: 5,
      otpType: OTPType.digitsOnly,
    );

    bool result = await myAuth.sendOTP();

    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("OTP was sent successfully"),
          backgroundColor: Colors.green,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );

      await Future.delayed(Duration(seconds: 1), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => otpVerficationResetpassword(
                  myAuth: myAuth,
                  email: _emailController.text.trim(),
                ),
          ),
        );
      });
      setState(() {
        _isLoading = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to send OTP"),
          backgroundColor: Colors.red,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 90),
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child:
                    _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 20),
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
                              SizedBox(height: 24),
                              Image.asset(
                                'assets/images/reset.png',
                                height: 300,
                              ),
                              SizedBox(height: 50),
                              Text(
                                "Reset Your Password",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Enter your email address below\nand we’ll send you a link with instructions",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 32),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Email Address",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),

                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(16),
                                ),

                                
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Email TextField with Icon
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: _emailController,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "Please enter your email address";
                                                  }
                                                  final emailRegex = RegExp(
                                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                                  );
                                                  if (!emailRegex.hasMatch(
                                                    value,
                                                  )) {
                                                    return "Enter a valid email";
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Enter Email Address',
                                                  border: InputBorder.none,
                                                  prefixIcon: Icon(
                                                    Icons.email_outlined,
                                                    color: Colors.green,
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.all(16),
                                                ),
                                              ),
                                            ),
                                            if (_isEmailValid)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 16,
                                                ),
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: Colors.green,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 24),

                              SizedBox(
                                width: double.infinity,
                                height: 55,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    _submitEmail();
                                    // if (_formKey.currentState!.validate()) {
                                    //   _emailController.clear();
                                    //   Navigator.pushNamed(
                                    //     context,
                                    //     '/otpVerficationResetpassword',
                                    //   );
                                    // }
                                  },
                                  child: Text(
                                    "Send Verification Code",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green[800],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 24),

                              Text(
                                "Need Help | FAQ | Terms Of use",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
