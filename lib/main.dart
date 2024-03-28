import 'package:egakko/core/cors.dart';
import 'package:egakko/screen/article_screen.dart';
import 'package:egakko/screen/course_screen.dart';
import 'package:egakko/screen/home_screen.dart';
import 'package:egakko/screen/onboarding_screen.dart';
import 'package:egakko/screen/profile_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter E-learning App',
      theme: AppTheme.lightTheme,
      home: OnboardingScreen(),
      routes:{
        HomeScreen.routeName: (context) => HomeScreen(),
        CourseScreen.routeName: (context) => CourseScreen(),
        ArticleScreen.routeName: (context) => ArticleScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
      }, 
    );
  }
}
