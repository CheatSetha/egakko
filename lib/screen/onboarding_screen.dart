import 'package:egakko/core/cors.dart';
import 'package:egakko/screen/home_screen.dart';
import 'package:egakko/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // This centers the children vertically
          children: [
            Transform.translate(
              offset: Offset(0, -50), // This moves the image 50 pixels upwards
              child: Image.asset(
                'assets/images/png/onboard.png',
                alignment: Alignment.topCenter,
                width: 400,
              ),
            ),
            _buttomContainer(context),
          ],
        ),
      ),
    );
  }
}

// for buttom container 
Widget _buttomContainer(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(20),
    
    width: double.infinity,
    height: 243,
    // add rouned top 
    decoration: BoxDecoration(
      color: AppColors.appWhite,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.topLeft,
          child: Text(
          'Let\'s Get Started',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
          
        ),
        ),
        SizedBox(height: 10),
        Container(
          child: Text(
            "The complete app to start learning new skill and growing your skill", style: TextStyle(fontSize: 16, color: AppColors.appGray4), textAlign: TextAlign.start,
          ),
        ),
        //  how to add float text 
        SizedBox(height: 60),
        
        CustomButton(
          text: 'Get Started',
          onPressed: () {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          },
        ),
      ],
    ),
  );
}