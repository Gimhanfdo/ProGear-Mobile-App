import 'package:flutter/material.dart';
import 'package:progear_app/screens/register.dart';
import 'package:progear_app/screens/shared/button.dart';
import 'package:progear_app/screens/shared/textField.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  //Controllers for the text fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
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
              'Sign in to your account',
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

            // Sign in button
            CustomButton(
              buttonText: 'Sign In',
              buttonColor: Colors.teal.shade600,
            ),

            const SizedBox(height: 15),

            //Sign in with Google button
            CustomButton(
              buttonText: 'Sign In with Google',
              buttonColor: Colors.grey.shade800,
              iconPath: 'assets/icons/google.png',
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not registered yet?'),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign up now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[500],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
