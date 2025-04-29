import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solarapp/services/fireAuth/firebaseAuthServices.dart';

class Newpassword extends StatefulWidget {
  Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  final _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible1 = false;
  bool _isPasswordVisible2 = false;

  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  final authService = Firebaseauthservices();

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
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
                  ),
                ),
                SizedBox(width: 8),
                Center(
                  child: Image.asset(
                    "assets/images/newpassword.png",
                    height: 350,
                  ),
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
                Text(
                  "Re Type Password",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // // Proceed with setting the new password

                      // // Navigator.pushNamed(context, '/loginScreen');
                      // // await authService.resetPasswordByEmail(email: widget.email);
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text('Password set successfully!'),
                      //     backgroundColor: Colors.green[800],
                      //     duration: Duration(seconds: 2),
                      //     behavior: SnackBarBehavior.floating,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(12),
                      //     ),
                      //   ),
                      // );
                      String? result = await authService.updatePassword(
                        _passwordController1.text,
                      );

                      if (result == null) {
                        // Success
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Password updated successfully! Please login again.',
                            ),
                            backgroundColor: Colors.green,
                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        Navigator.pushReplacementNamed(
                          context,
                          '/loginScreen',
                        ); // Or wherever you want
                      } else {
                        // Error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(result),
                            backgroundColor: Colors.red,
                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                      _passwordController1.clear();
                      _passwordController2.clear();
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
