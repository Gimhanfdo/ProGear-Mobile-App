// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:progear_app/screens/login.dart';

class User {
  final int _userID;
  String _name;
  String _phoneNumber;
  final String _email;
  String _password;

  //Constructor
  User({
    required int userID,
    required String name,
    required String phoneNumber,
    required String email,
    required String password,
  }) : _userID = userID,
       _name = name,
       _phoneNumber = phoneNumber,
       _email = email,
       _password = password;

  //Getters
  int get userID => _userID;
  String get name => _name;
  String get phoneNumber => _phoneNumber;
  String get email => _email;
  String get password => _password;
}

//Details of the logged in user
class LoggedInUser extends User {
  LoggedInUser()
    : super(
        userID: 1,
        name: 'John Smith',
        phoneNumber: '0771234570',
        email: 'john.smith@example.com',
        password: 'John_Smith@2000',
      );

  static void logOut(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            title: Text('PROGEAR'),
            content: Text("Are you sure you want to log out?"),
            actions: [
              TextButton(
                onPressed: () {
                  // Navigate to Login screen
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to Login screen
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text('Log out'),
              ),
            ],
          ),
    );
  }
}
