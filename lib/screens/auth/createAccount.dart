// import 'package:flutter/material.dart';

// class createAccount extends StatefulWidget {
//   createAccount({super.key});
//   State<createAccount> createState() => _createAccountState();
// }

// class _createAccountState extends State<createAccount> {
//   final TextEditingController _emailController = TextEditingController();
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(50),
//             topRight: Radius.circular(50),
//           ),
//           color: Colors.white,
//         ),
//         // color: Colors.white,
//         margin: EdgeInsets.only(top: 120),
//         padding: EdgeInsets.only(bottom: 20),
//         height: double.infinity,
//         child: SafeArea(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(horizontal: 26),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 20),
//                 Center(
//                   child: Column(
//                     children: [
//                       Text(
//                         "Create New Account",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 24,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         "Let’s create new account for explore continues",
//                         style: TextStyle(color: Colors.grey, fontSize: 14),
//                       ),
//                       SizedBox(height: 24),
//                       Image(
//                         image: AssetImage(
//                           'assets/images/logo.png',
//                         ), // Replace with your actual logo path
//                         height: 350,
//                         width: double.infinity,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 36),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Email or Phone Number",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.green),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Row(
//                     children: [
//                       const SizedBox(width: 12),
//                       Icon(Icons.mail_outline, color: Colors.green),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: TextField(
//                           controller: _emailController,
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             hintText: 'enter your email',
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 12),
//                         child: Icon(Icons.check_circle, color: Colors.green),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 32),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 55,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       print("create account");
//                     },
//                     child: Text("Continue" , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w600 , color: Colors.white),),
//                     style:ElevatedButton.styleFrom(
//                       backgroundColor:Colors.green[800],
//                       shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
//                     )
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class createAccount extends StatefulWidget {
//   const createAccount({super.key});

//   @override
//   State<createAccount> createState() => _createAccountState();
// }

// class _createAccountState extends State<createAccount> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
//   }

//   bool isValidEmailOrPhone(String value) {
//     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     final phoneRegex = RegExp(r'^\+?[0-9]{8,15}$');
//     return emailRegex.hasMatch(value) || phoneRegex.hasMatch(value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(50),
//             topRight: Radius.circular(50),
//           ),
//           color: Colors.white,
//         ),
//         margin: EdgeInsets.only(top: 120),
//         padding: EdgeInsets.only(bottom: 20),
//         height: double.infinity,
//         child: SafeArea(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(horizontal: 26),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 20),
//                   Center(
//                     child: Column(
//                       children: [
//                         Text(
//                           "Create New Account",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 24,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Let’s create new account for explore continues",
//                           style: TextStyle(color: Colors.grey, fontSize: 14),
//                         ),
//                         SizedBox(height: 24),
//                         Image.asset(
//                           'assets/images/logo.png',
//                           height: 350,
//                           width: double.infinity,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 36),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Email or Phone Number",
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Container(
//                     padding: EdgeInsets.only(left: 8),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.green),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(Icons.mail_outline, color: Colors.green),
//                         SizedBox(width: 8),
//                         Expanded(
//                           child: TextFormField(
//                             controller: _emailController,
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: 'Enter your email or phone',
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter email or phone';
//                               } else if (!isValidEmailOrPhone(value)) {
//                                 return 'Invalid email or phone number';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 12),
//                           child: Icon(Icons.check_circle, color: Colors.green),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 55,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           print("Creating account for: ${_emailController.text}");
//                           // proceed with account creation
//                         }
//                       },
//                       child: Text(
//                         "Continue",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white,
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green[800],
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(18),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Resetpasswordscreen extends StatefulWidget {
  const Resetpasswordscreen({super.key});

  @override
  State<Resetpasswordscreen> createState() => _ResetpasswordscreenState();
}

class _ResetpasswordscreenState extends State<Resetpasswordscreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool _isValidEmail = false;

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

  bool isValidEmail(String value) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) return false;

    final allowedDomains = [
      'gmail.com',
      'yahoo.com',
      'outlook.com',
      'hotmail.com',
      'icloud.com',
    ];

    final domain = value.split('@').last.toLowerCase();
    return allowedDomains.contains(domain);
  }

  void _validateEmail() {
    final input = _emailController.text.trim();
    setState(() {
      _isValidEmail = isValidEmail(input);
    });
  }

  void _submitResetRequest() {
    if (_formKey.currentState!.validate()) {
      print("Sending reset email to: ${_emailController.text}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Reset link sent to ${_emailController.text} "),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 90),
        padding: EdgeInsets.only(bottom: 20),
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Image.asset('assets/images/reset.png', height: 280),
                    SizedBox(height: 36),
                    Text(
                      "Reset Your Password",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
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
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.email_outlined, color: Colors.green),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter your email',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!isValidEmail(value)) {
                                  return 'Invalid email or unsupported domain';
                                }
                                return null;
                              },
                            ),
                          ),
                          if (_isValidEmail)
                            Icon(Icons.check_circle, color: Colors.green),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: (){
                          _submitResetRequest();
                          _emailController.clear();
                          
                        },
                        child: Text(
                          "Send Verification Code",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
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
        ),
      ),
    );
  }
}
