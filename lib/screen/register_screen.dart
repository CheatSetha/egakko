import 'package:egakko/screen/home_screen.dart';
import 'package:egakko/screen/login_screen.dart';
import 'package:egakko/widgets/custom_button.dart';
import 'package:egakko/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register';
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 60),
              child: Text(
                "Hello! Register to get started",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.left,
              ),
            ),
            CustomTextField(
              hintText: 'Name',
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: 'Confirm Password',
              obscureText: true,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Register',
              onPressed: () {
                // Add your registration logic here
              },
            ),

            // oauth elements
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'or login with',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // login with google button , facebook button and apple id button
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                //  add grab for all children with consitent width and height

                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                          width: 100,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(112, 55, 54, 54)
                                  .withOpacity(0.1),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              // assets\images\svg\authentication.svg
                              image:
                                  AssetImage('assets/images/png/facebook.png'),
                            ),
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                          width: 100,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(112, 55, 54, 54)
                                  .withOpacity(0.1),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              // assets\images\svg\authentication.svg
                              image: AssetImage('assets/images/png/google.png'),
                            ),
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                          width: 100,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(112, 55, 54, 54)
                                  .withOpacity(0.1),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              // assets\images\svg\authentication.svg
                              image: AssetImage('assets/images/png/apple.png'),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),

            // text with link to register at the bottom "Don't have an account? Register"
            Container(
              
              margin: EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have a account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle register
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                      
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
