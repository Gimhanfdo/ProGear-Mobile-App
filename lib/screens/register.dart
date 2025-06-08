import 'package:flutter/material.dart';
import 'package:progear_app/screens/shared/button.dart';
import 'package:progear_app/screens/shared/errorAlertDialog.dart';
import 'package:progear_app/screens/shared/textField.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  //Controllers for the text fields
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validated (BuildContext context){
    final name = nameController.text;
    final phoneNumber = phoneController.text;
    final email = emailController.text;
    final password = passwordController.text;

    //Empty field validation
    if (name.isEmpty || phoneNumber.isEmpty || email.isEmpty || password.isEmpty) {
      showErrorAlertDialog(context, 'Empty fields found. Please check and try again.');
    return false;
    }

    // Phone number validation
    if (!RegExp(r'^\d{10}$').hasMatch(phoneNumber)) {
        showErrorAlertDialog(context, 'Phone number should contain 10 digits.');
      return false;
    }

    // Email validation
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      showErrorAlertDialog(context, 'Please enter a valid email address.');
      return false;
    }

    // Password validation
    if (password.length < 6 || !RegExp(r'[A-Z]').hasMatch(password) || !RegExp(r'\d').hasMatch(password) || !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password))  {
      showErrorAlertDialog(context, 'Password must be atleast 6 characters long and contain atleast one uppercase, one digit and one special character.');
      return false;
    }

    else{
      return true;
    }
  }

  //Proceed to register if inputs are validated
  void signUp(BuildContext context){
    if (validated(context)){
      showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (context) => AlertDialog(
              title: Text('PROGEAR'),
              content: Text("Registrtion successful"),
              actions: [
                TextButton(
                  onPressed: () {
                    // Navigate back to Login screen
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          
                SizedBox(height: 25),
          
                Text(
                  'Create your account now',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          
                SizedBox(height: 15),
          
                CustomTextField(
                  labelText: 'Full Name',
                  textController: nameController,
                  hintText: 'Enter your full name',
                  obscureText: false,
                ),
          
                SizedBox(height: 15),
          
                CustomTextField(
                  labelText: 'Phone Number',
                  textController: phoneController,
                  hintText: 'Enter your phone number',
                  obscureText: false,
                ),
          
                SizedBox(height: 15),
          
                CustomTextField(
                  labelText: 'Email Address',
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
          
                SizedBox(height: 25),
          
                // Sign up button
                CustomButton(
                  buttonText: 'Sign Up',
                  buttonColor: Colors.teal.shade600,
                  onTap: (){
                    signUp(context);
                  },
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
