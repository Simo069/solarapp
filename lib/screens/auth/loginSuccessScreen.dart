

import 'package:flutter/material.dart';

class loginSuccessScreen extends StatefulWidget{
  const loginSuccessScreen({super.key});

  @override
  State<loginSuccessScreen> createState() => _loginSuccessScreenState();
}


class _loginSuccessScreenState extends State<loginSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 150),
          padding: EdgeInsets.only(bottom: 20),
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Center(
                  child: Image.asset("assets/images/success.png", height: 350),
                ),
          
                SizedBox(height: 24,),
          
                Center(
                  child: Text(
                    "Yes! Login Successfull",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
                SizedBox(height: 8),
                Center(child: Text("You will be moved to home screen right now." , style: TextStyle(color: Colors.grey , ),),),
                SizedBox(height: 32),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to home screen or next screen
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade800,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size.fromHeight(55),
                ),
                child: const Text(
                  "Lets Explore",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600 , color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}