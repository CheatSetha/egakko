import 'package:egakko/components/UserStatus.dart';
import 'package:egakko/screen/home_screen.dart';
import 'package:egakko/screen/register_screen.dart';
import 'package:egakko/widgets/custom_button.dart';
import 'package:egakko/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
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
                "Welcome back! \nGlad to see you, Again!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.left,
              ),
            ),
            CustomTextField(
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            Container(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              text: 'Login',
              onPressed: () {
                String username = emailController.text;
                String password = passwordController.text;

                if (username == 'setha' && password == '123' ||
                    username == 'chhaiteth' && password == '123') {
                  Provider.of<UserStatus>(context, listen: false).login();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  // Show an error message
                  ScaffoldMessenger.of(context).showSnackBar(
                  const  SnackBar(
                        content: Text(
                            'Invalid username or password!')),
                  );
                }
              },
            ),

            //  a ruler to separate login and with text "or login with"
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
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(112, 55, 54, 54)
                                  .withOpacity(0.1),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              'assets/images/png/facebook.png',
                              width: 30, height: 30,
                              fit: BoxFit.fitHeight,
                              // fit: BoxFit.fill,
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
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(112, 55, 54, 54)
                                  .withOpacity(0.1),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              'assets/images/png/google.png',
                              width: 30, height: 30,
                              fit: BoxFit.fitHeight,
                              // fit: BoxFit.fill,
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
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(112, 55, 54, 54)
                                  .withOpacity(0.1),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              'assets/images/png/apple.png',
                              width: 30, height: 30,
                              fit: BoxFit.fitHeight,
                              // fit: BoxFit.fill,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),

            // text with link to register at the bottom "Don't have an account? Register"
            Container(
              margin: EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle register
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Text(
                      'Register',
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
