import 'package:flutter/material.dart';
import 'package:solarapp/screens/auth/createAccountInfo.dart';
import 'package:flutter/gestures.dart';
import 'package:solarapp/services/fireAuth/firebaseAuthServices.dart';

class createAccount extends StatefulWidget {
  const createAccount({super.key});

  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool _isValidEmail = false;

  bool isLoading = false;

  final authService = Firebaseauthservices();

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

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      bool isExist = await authService.checkEmailExists(
        _emailController.text.trim(),
      );
      if (isExist) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("email already exist"),
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
        setState(() {
        isLoading = false;
      });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                    createAccountInfo(email: _emailController.text.trim()),
          ),
        );
        setState(() {
        isLoading = false;
      });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Container(
        margin: EdgeInsets.only(top: 120),
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
          child:
              isLoading
                  ? Container(child: Center(child: CircularProgressIndicator()))
                  : SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 26),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Center(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios_new,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Create New Account",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Let’s create new account for explore continues",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 24),
                                Image.asset(
                                  'assets/images/logo.png',
                                  height: 350,
                                  width: double.infinity,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 36),
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
                            padding: EdgeInsets.only(left: 8),
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
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height: 32),
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () async {
                                _submitForm();
                                // Navigator.pushNamed(context, '/createAccountInfo' ,
                                // arguments: {'email': _emailController.text.trim()}
                                // );
                              },
                              child: Text(
                                "Continue",
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
                          const SizedBox(height: 24),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: "Do you  have an account?",
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text: " Sign in here",
                                    style: TextStyle(
                                      color: Colors.green[900],
                                      fontWeight: FontWeight.w500,
                                    ),
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              '/loginScreen',
                                              (route) => false,
                                            );
                                          },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
        ),
      ),
    );
  }
}
