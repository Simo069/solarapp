// import 'package:flutter/material.dart';

// class Newpassword extends StatefulWidget {
//   const Newpassword({super.key});

//   @override
//   State<Newpassword> createState() => _NewpasswordState();
// }

// class _NewpasswordState extends State<Newpassword> {
//   bool _isPasswordVisible1 = false;
//   bool _isPasswordVisible2 = false;

//   final TextEditingController _passwordController1 = TextEditingController();
//   final TextEditingController _passwordController2 = TextEditingController();

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container(
//         margin: EdgeInsets.only(top: 90),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(40),
//             topRight: Radius.circular(40),
//           ),
//           color: Colors.white,

//         ),
//         child: SafeArea(
          
//           child: ListView(
//             padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//             children: [
//               Center(
//                 child: Image.asset("assets/images/newpassword.png", height: 350),
//               ),
//               SizedBox(height: 24),
//               Center(
//                 child: Text(
//                   "Enter New Password",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
//                 ),
//               ),
//               SizedBox(height: 8),
        
//               Center(
//                 child: Text(
//                   "Set Complex passwords to protect",
//                   style: TextStyle(color: Colors.grey[600], fontSize: 16),
//                 ),
//               ),
//               SizedBox(height: 32),
//               Text('Password', style: TextStyle(fontWeight: FontWeight.bold)),
//               SizedBox(height: 8),
//               buildPasswordField(
//                 controller: _passwordController1,
//                 isVisible: _isPasswordVisible1,
//                 onToggleVisibility: () {
//                   setState(() {
//                     _isPasswordVisible1 = !_isPasswordVisible1;
//                   });
//                 },
//               ),
        
//               SizedBox(height: 20),
        
//               Text(
//                 "Re Type Password ",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               buildPasswordField(
//                 controller: _passwordController2,
//                 isVisible: _isPasswordVisible2,
//                 onToggleVisibility: () {
//                   setState(() {
//                     _isPasswordVisible2 != !_isPasswordVisible2;
//                   });
//                 },
//               ),
        
//               SizedBox(height: 32),
        
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green[800],
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                 ),
//                 child: Text(
//                   'Set New Password',
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
        
//               SizedBox(height: 24),
        
//               Center(
//                 child: Text(
//                   'Need  Help | FAQ | Terms Of use',
//                   style: TextStyle(
//                     color: Colors.black87,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildPasswordField({
//     required TextEditingController controller,
//     required bool isVisible,
//     required VoidCallback onToggleVisibility,
//   }) {
//     return TextField(
//       controller: controller,
//       obscureText: !isVisible,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Color(0xFFF7F7F9),
//         prefixIcon: Icon(Icons.lock, color: Colors.green),
//         suffixIcon: IconButton(
//           icon: Icon(
//             isVisible ? Icons.visibility : Icons.visibility_off,
//             color: Colors.grey,
//           ),
//           onPressed: onToggleVisibility,
//         ),
//         hintText: "Enter your password",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  final _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible1 = false;
  bool _isPasswordVisible2 = false;

  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  @override
  void dispose() {
    _passwordController1.dispose();
    _passwordController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 90),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Colors.white,
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              children: [
                Center(
                  child: Image.asset("assets/images/newpassword.png", height: 350),
                ),
                SizedBox(height: 24),
                Center(
                  child: Text(
                    "Enter New Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    "Set Complex passwords to protect",
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                ),
                SizedBox(height: 32),
                Text('Password', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                buildPasswordField(
                  controller: _passwordController1,
                  isVisible: _isPasswordVisible1,
                  onToggleVisibility: () {
                    setState(() {
                      _isPasswordVisible1 = !_isPasswordVisible1;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("Re Type Password", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                buildPasswordField(
                  controller: _passwordController2,
                  isVisible: _isPasswordVisible2,
                  onToggleVisibility: () {
                    setState(() {
                      _isPasswordVisible2 = !_isPasswordVisible2;
                    });
                  },
                  validator: (value) {
                    if (value != _passwordController1.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Proceed with setting the new password
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Password set successfully!') ,
                          backgroundColor: Colors.green[800],
                          duration: Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                          
                        ),

                      );
                      
                      _passwordController1.clear();
                      _passwordController2.clear();
                      Navigator.pushNamed(context, '/loginScreen');
                    }

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'Set New Password',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(height: 24),
                Center(
                  child: Text(
                    'Need Help | FAQ | Terms Of use',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField({
    required TextEditingController controller,
    required bool isVisible,
    required VoidCallback onToggleVisibility,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: !isVisible,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF7F7F9),
        prefixIcon: Icon(Icons.lock, color: Colors.green),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: onToggleVisibility,
        ),
        hintText: "Enter your password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
