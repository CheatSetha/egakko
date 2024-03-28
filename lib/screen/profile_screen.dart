
import 'package:egakko/screen/login_screen.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Profile Screen',
            style: TextStyle(fontSize: 24),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Text('Login'),
          ),
          
        ],
      ),
    );
  }
}
