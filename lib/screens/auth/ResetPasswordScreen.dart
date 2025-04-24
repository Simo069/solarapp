// import 'package:flutter/material.dart';

// class Resetpasswordscreen extends StatefulWidget {
//   Resetpasswordscreen({super.key});
//   @override
//   State<Resetpasswordscreen> createState() => _ResetpasswordscreenState();
// }

// class _ResetpasswordscreenState extends State<Resetpasswordscreen> {
//   final TextEditingController _emailController = TextEditingController();
//   bool _isEmailValid = false;

//   @override
//   void initState() {
//     super.initState();
//     _emailController.addListener(_validateEmail);
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
//   }

//   void _validateEmail() {
//     String email = _emailController.text.trim();
//     final isValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
//     setState(() {
//       _isEmailValid = isValid;
//     });
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 margin: EdgeInsets.only(top: 90),
//                 padding: EdgeInsets.symmetric(horizontal: 24),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       SizedBox(height: 24),
//                       Image.asset(
//                         'assets/images/reset.png', // Replace with your image
//                         height: 300,
//                       ),
//                       SizedBox(height: 50),
//                       Text(
//                         "Reset Your Password",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 12),
//                       Text(
//                         "Enter your email address below\nand we’ll send you a link with instructions",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                       SizedBox(height: 32),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Email Address",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 8),

//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.grey[100],
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: TextField(
//                           controller: _emailController,
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: InputDecoration(
//                             hintText: 'Enter Email Address',
//                             border: InputBorder.none,
//                             prefixIcon: Icon(Icons.email_outlined, color: Colors.green),
//                             contentPadding: EdgeInsets.all(16),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 24),

//                       SizedBox(
//                         width: double.infinity,
//                         height: 55,
//                         child: ElevatedButton(
//                           // onPressed: _isEmailValid
//                           //     ? () {
//                           //         print("Sending code to: ${_emailController.text}");
//                           //       }
//                           //     : null,
//                           onPressed: (){

//                           },
//                           child: Text(
//                             "Send Verification Code",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.green[800],
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             disabledBackgroundColor: Colors.grey[400],
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 24),

//                       Text(
//                         "Need Help | FAQ | Terms Of use",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 20),

//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ResetPasswordscreen extends StatefulWidget {
  const ResetPasswordscreen({super.key});

  @override
  State<ResetPasswordscreen> createState() => _ResetPasswordscreenState();
}

class _ResetPasswordscreenState extends State<ResetPasswordscreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  bool _isEmailValid = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    String email = _emailController.text.trim();
    final isValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
    setState(() {
      _isEmailValid = isValid;
    });
  }

  void _submitEmail() {
    String email = _emailController.text.trim();
    if (_isEmailValid) {
      // Email is valid — do something (e.g., send code)
      print("Sending verification to $email");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Verification code sent to $email"),
          backgroundColor: Colors.green,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
        ),
      );
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 24),
                      Image.asset('assets/images/reset.png', height: 300),
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
                        style: TextStyle(fontSize: 15, color: Colors.grey[600]),
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
                        // child: TextField(
                        //   controller: _emailController,
                        //   keyboardType: TextInputType.emailAddress,
                        //   decoration: InputDecoration(
                        //     hintText: 'Enter Email Address',
                        //     border: InputBorder.none,
                        //     prefixIcon: Icon(
                        //       Icons.email_outlined,
                        //       color: Colors.green,
                        //     ),
                        //     contentPadding: EdgeInsets.all(16),
                        //   ),
                        // ),
                        child: Form(
                          key: _formKey,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your email address";
                                }
                                final emailRegex = RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                );
                                if (!emailRegex.hasMatch(value)) {
                                  return "Enter a valid email";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter Email Address',
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.green,
                                ),
                                contentPadding: EdgeInsets.all(16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            _submitEmail();
                            if (_formKey.currentState!.validate()) {
                              _emailController.clear();
                              Navigator.pushNamed(context, '/otpVerficationResetpassword');
                            }
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
