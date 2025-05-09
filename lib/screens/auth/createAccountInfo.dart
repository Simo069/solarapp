import 'package:flutter/material.dart';
import 'package:solarapp/screens/auth/OTPVerificationScreen.dart';
import 'package:email_otp/email_otp.dart';

class createAccountInfo extends StatefulWidget {
  late final String? email;
  createAccountInfo({super.key, this.email});

  @override
  State<createAccountInfo> createState() => _createAccountinfoState();
}

class _createAccountinfoState extends State<createAccountInfo> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  String? _selectedGender;
  DateTime? _selectedDateOfBirth;

  final EmailOTP myAuth = EmailOTP();

  void initState() {
    super.initState();
    // Initialize any necessary data or state here
    print("email: ${widget.email}");
  }

  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _sendOTP() async {
    myAuth.setConfig(
      appEmail: "mohammedboukhatem069@gmail.com", // Your app's email
      appName: "Solar App",
      userEmail: widget.email, // User's email
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
      setState(() {
        _isLoading = false;
      });
      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => OTPVerificationScreen(
                  firstname: _firstNameController.text.trim(),
                  lastname: _lastNameController.text.trim(),
                  email: widget.email,
                  phone: _phoneController.text.trim(),
                  password: _passwordController.text.trim(),
                  gender: _selectedGender!,
                  dateOfBirth: _selectedDateOfBirth!,
                  myAuth: myAuth,
                ),
          ),
        );
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 90),
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Colors.white,
        ),
        child: SafeArea(
          child:
              _isLoading
                  ? Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.white,
                    child: Center(child: CircularProgressIndicator()),
                  )
                  : SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
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
                                      "Create Your Account ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 26,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Create account for exploring news",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Image.asset(
                            "assets/images/logo.png",
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 16),
                          _buildTextField(
                            label: "First Name",
                            hint: "First Name",
                            icon: Icons.person_outline,
                            controller: _firstNameController,
                            validator:
                                (value) =>
                                    value == null || value.isEmpty
                                        ? "Please enter your first name"
                                        : null,
                          ),
                          SizedBox(height: 16),
                          _buildTextField(
                            label: "Last Name",
                            hint: "Last Name",
                            icon: Icons.person_outline,
                            controller: _lastNameController,
                            validator:
                                (value) =>
                                    value == null || value.isEmpty
                                        ? "Please enter your last name"
                                        : null,
                          ),
                          SizedBox(height: 16),
                          _buildTextField(
                            label: "Phone Number",
                            hint: "Enter your phone number",
                            icon: Icons.phone,
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              final phoneRegex = RegExp(r'^\+?[0-9]{8,15}$');
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              } else if (!phoneRegex.hasMatch(value)) {
                                return 'Invalid phone number';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            
                            children: [
                              
                              Text(
                                "Gender",
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 12,),
                              DropdownButtonFormField<String>(
                                value: _selectedGender,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedGender = newValue;
                                  });
                                },
                                decoration: InputDecoration(
                                  // labelText: "Gender",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.green,
                                  ),
                                ),
                                validator:
                                    (value) =>
                                        value == null
                                            ? 'Please select your gender'
                                            : null,
                                items:
                                    ['Male', 'Female'].map((gender) {
                                      return DropdownMenuItem<String>(
                                        value: gender,
                                        child: Text(gender),
                                      );
                                    }).toList(),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Text(
                                "Date of Birth",
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 12,),
                              GestureDetector(
                                onTap: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime(
                                      2000,
                                    ), // default starting date
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      _selectedDateOfBirth = picked;
                                    });
                                  }
                                },
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText:
                                          _selectedDateOfBirth == null
                                              ? 'Date of Birth'
                                              : '${_selectedDateOfBirth!.toLocal().toString().split(' ')[0]}',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey[100],
                                      prefixIcon: Icon(
                                        Icons.calendar_today,
                                        color: Colors.green,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (_selectedDateOfBirth == null) {
                                        return 'Please select your date of birth';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          _buildTextField(
                            label: "Enter your password",
                            hint: "Enter your password",
                            icon: Icons.lock_outline_sharp,
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            toggleVisibility: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password";
                              }
                              if (value.length < 8) {
                                return "Password must be at least 8 characters";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),
                          _buildTextField(
                            label: "Re Type Password",
                            hint: "Re Type Password",
                            icon: Icons.lock,

                            controller: _passwordConfirmController,
                            obscureText: _obscureConfirmPassword,
                            toggleVisibility: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please retype your password";
                              }
                              if (_passwordController.text != value) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 32),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[800],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 16),
                              ),
                              onPressed: () {
                                try {
                                  if (_formKey.currentState!.validate()) {
                                    debugPrint("testst 111");
                                    debugPrint(
                                      "First name: ${_firstNameController.text}",
                                    );
                                    debugPrint(
                                      "Last name: ${_lastNameController.text}",
                                    );
                                    debugPrint(
                                      "Password: ${_passwordController.text}",
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Information saved successfully!",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        backgroundColor: Colors.green,
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10,
                                        ),
                                        duration: Duration(seconds: 3),
                                        elevation: 6,
                                      ),
                                    );

                                    print("email: ${widget.email}");

                                    setState(() {
                                      _isLoading = true;
                                    });

                                    _sendOTP();
                                  } else {
                                    debugPrint("testst 222");

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Please correct the errors.",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        backgroundColor: Colors.red[700],
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10,
                                        ),
                                        duration: Duration(seconds: 3),
                                        elevation: 6,
                                      ),
                                    );
                                  }
                                } catch (e, s) {
                                  debugPrint("Error in onPressed: $e\n$s");
                                }
                              },
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 48),
                        ],
                      ),
                    ),
                  ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    bool obscureText = false,
    VoidCallback? toggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[100],
            prefixIcon: Icon(icon, color: Colors.green),
            suffixIcon:
                toggleVisibility != null
                    ? IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: toggleVisibility,
                    )
                    : null,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }
}
