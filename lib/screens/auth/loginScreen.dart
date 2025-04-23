import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool _isPasswordVisible = false;
  bool _keepSignedIn = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Let’s login for explore continues",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    SizedBox(height: 24),
                    Image(
                      image: AssetImage(
                        'assets/images/logo.png',
                      ), // Replace with your actual logo path
                      height: 170,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 36),
              Text(
                "Email or phone number",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.green),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),

              _buildPasswordField(),

              SizedBox(height: 8),

              Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: const BorderSide(
                      color: Colors.green, // Border color (always green)
                      width: 2,
                    ),
                    checkColor: Colors.white, // Color of the checkmark
                    fillColor: MaterialStateProperty.resolveWith<Color>((
                      Set<MaterialState> states,
                    ) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.green; // Background when checked
                      }
                      return Colors.white; // Background when unchecked
                    }),
                    value: _keepSignedIn,
                    onChanged: (value) {
                      setState(() {
                        _keepSignedIn = value!;
                      });
                    },
                  ),

                  const Text("Keep me signed in"),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      print("forget password");
                    },
                    child: const Text(
                      "Forgot password",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 24),

              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "You can connect with ",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/facebook.png"),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/google.png"),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/apple.png"),
                  ),
                ],
              ),
              SizedBox(height: 24),

              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Dont't have an account?",
                    style: TextStyle(color: Colors.grey[900], fontSize: 14 , fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: " Sign up here",
                        style: TextStyle(
                          color: Colors.green[900],
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate to SignUpScreen
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => SignUpScreen(),
                                //   ),
                                // );
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildPasswordField({
  //   required TextEditingController controller,
  //   required bool isVisible,
  //   required VoidCallback onToggleVisibility,
  // }) {
  //   return TextField(
  //     controller: controller,
  //     obscureText: !isVisible,
  //     decoration: InputDecoration(
  //       filled: true,
  //       fillColor: Color(0xFFF7F7F9),
  //       prefixIcon: Icon(Icons.lock, color: Colors.green),
  //       suffixIcon: IconButton(
  //         icon: Icon(
  //           isVisible ? Icons.visibility : Icons.visibility_off,
  //           color: Colors.grey,
  //         ),
  //         onPressed: onToggleVisibility,
  //       ),
  //       hintText: "Enter your password",
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12),
  //         borderSide: BorderSide.none,
  //       ),
  //     ),
  //   );
  // }
  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        hintText: "Enter your password",
        prefixIcon: const Icon(Icons.lock, color: Colors.green),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        filled: true,
        fillColor: const Color(0xFFF7F7F9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  void _handleLogin() {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    // Here you can implement authentication logic
    print("Email: $email");
    print("Password: $password");
    print("Keep Signed In: $_keepSignedIn");
  }
}
