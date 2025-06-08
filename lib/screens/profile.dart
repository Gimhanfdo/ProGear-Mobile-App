import 'package:flutter/material.dart';
import 'package:progear_app/models/user.dart';
import 'package:progear_app/screens/shared/button.dart';
import 'package:progear_app/screens/shared/customHomeAppBar.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final loggedInUser = LoggedInUser();

    Widget profileRow(String title, String value) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 18,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: const CustomHomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture', style: TextStyle(fontSize: 16),),
                    ),
                  ],
                ),
              ),

              //Details
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 5),

              Text(
                'Profile Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              profileRow('Name', loggedInUser.name),
              const SizedBox(height: 5,),
              profileRow('Contact Number', loggedInUser.phoneNumber),
              const SizedBox(height: 5,),
              profileRow('Email', loggedInUser.email),

              const SizedBox(height: 40),

              CustomButton(
                buttonText: 'Log out',
                buttonColor: Colors.red.shade700,
                onTap: () {
                  LoggedInUser.logOut(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
