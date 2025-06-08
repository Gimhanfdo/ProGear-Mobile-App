import 'package:flutter/material.dart';
import 'package:progear_app/models/user.dart';
import 'package:progear_app/screens/home.dart';
import 'package:progear_app/screens/navigationWrapper.dart';
import 'package:progear_app/screens/register.dart';
import 'package:progear_app/screens/shared/button.dart';
import 'package:progear_app/screens/shared/errorAlertDialog.dart';
import 'package:progear_app/screens/shared/textField.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  //Controllers for the text fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text;

    final loggedInUser = LoggedInUser();

    if (email == loggedInUser.email && password == loggedInUser.password) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (context) => AlertDialog(
              title: Text('PROGEAR'),
              content: Text("Login successful"),
              actions: [
                TextButton(
                  onPressed: () {
                    // Navigate to Home screen
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => NavigationWrapper()),
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            ),
      );
    } else {
      showErrorAlertDialog(context, 'EIncorrect username or password.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //To avoid notches and status bars
        child: SingleChildScrollView(
          //Scrollable view
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  'PROGEAR',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 25),

                Text(
                  'Sign in to your account',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 15),

                CustomTextField(
                  labelText: 'Email',
                  textController: emailController,
                  hintText: 'Enter your email',
                  obscureText: false,
                ),

                SizedBox(height: 15),

                CustomTextField(
                  labelText: 'Password',
                  textController: passwordController,
                  hintText: 'Enter your password',
                  obscureText: true,
                ),

                SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.teal[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Sign in button
                CustomButton(
                  buttonText: 'Sign In',
                  buttonColor: Colors.teal.shade600,
                  onTap: () {
                    login(context);
                  },
                ),

                const SizedBox(height: 25),

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
        ),
      ),
    );
  }
}
