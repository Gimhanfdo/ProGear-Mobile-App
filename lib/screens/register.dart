import 'package:flutter/material.dart';
import 'package:progear_app/screens/shared/button.dart';
import 'package:progear_app/screens/shared/textField.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  //Controllers for the text fields
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea( //To avoid notches and status bars
        child: SingleChildScrollView( //Scrollable view
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  'PROGEAR',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          
                SizedBox(height: 25),
          
                Text(
                  'Create your account now',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          
                SizedBox(height: 15),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Row(
                    children: [
                      Text('Full Name', style: TextStyle(color: Colors.grey[800])),
                    ],
                  ),
                ),
          
                SizedBox(height: 5),
          
                CustomTextField(
                  textController: nameController,
                  hintText: 'Enter your full name',
                  obscureText: false,
                ),
          
                SizedBox(height: 15),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Row(
                    children: [
                      Text('Phone number', style: TextStyle(color: Colors.grey[800])),
                    ],
                  ),
                ),
          
                SizedBox(height: 5),
          
                CustomTextField(
                  textController: phoneController,
                  hintText: 'Enter your phone number',
                  obscureText: false,
                ),
          
                SizedBox(height: 15),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Row(
                    children: [
                      Text('Email', style: TextStyle(color: Colors.grey[800])),
                    ],
                  ),
                ),
          
                SizedBox(height: 5),
          
                CustomTextField(
                  textController: emailController,
                  hintText: 'Enter your email',
                  obscureText: false,
                ),
          
                SizedBox(height: 15),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Row(
                    children: [
                      Text('Password', style: TextStyle(color: Colors.grey[800])),
                    ],
                  ),
                ),
          
                SizedBox(height: 5),
                CustomTextField(
                  textController: passwordController,
                  hintText: 'Enter your password',
                  obscureText: true,
                ),
          
                SizedBox(height: 15),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Row(
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.teal[600]),
                      ),
                    ],
                  ),
                ),
          
                const SizedBox(height: 25),
          
                // Sign up button
                CustomButton(
                  buttonText: 'Sign Up',
                  buttonColor: Colors.teal.shade600,
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
