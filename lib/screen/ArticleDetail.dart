import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article detail Screen'),
      ),
      body: Center(
        child: Text('This is the detail screen'),
      ),
    );
  }
}