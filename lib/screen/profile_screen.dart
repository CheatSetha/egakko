import 'package:egakko/components/UserStatus.dart';
import 'package:egakko/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Consumer<UserStatus>(
      builder: (context, userStatus, child) {
        if (userStatus.isLoggedIn) {
          // If the user is logged in, show the profile
          return Center(
            child: Column(
              children: [
                Text(
                  'Profile Screen',
                  style: TextStyle(fontSize: 24),
                ),
                // Add more widgets here for the profile screen
              ],
            ),
          );
        } else {
          // If the user is not logged in, redirect to the login page
          return LoginScreen();
        }
      },
    );
  }
}