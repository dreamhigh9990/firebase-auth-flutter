import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_demo/Screens/Intro/Intro_screen.dart';
import 'package:flutter/material.dart';
import '/Screens/Home/home_screen.dart';
import '/responsive.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '/utils/showSnackbar.dart';

import '../Signup/signup_screen.dart';
import '../../components/background.dart';

import '/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';
import '/widgets/custom_textfield.dart';
import '../../../constants.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login-email-password';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  Future<void> loginWithEmail(BuildContext context) async {
    try {
      // UserCredential userCredential =
      //     await FirebaseAuth.instance.signInWithEmailAndPassword(
      //   email: emailController.text,
      //   password: passwordController.text,
      // );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return IntroScreen();
          },
        ),
      );

      // Login successful, navigate to the next screen or perform other actions
    } on FirebaseAuthException catch (e) {
      print("!!!!!!!!" + e.message!);
      // if you want to display your own custom error message
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      showSnackBar(
          context, e.message!); // Displaying the usual firebase error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // const LoginScreenTopImage(),
              Row(
                children: [
                  Spacer(),
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Let's get you \nsigned in",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            height:1.2,
                            fontFamily: 'Spectral'
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Welcome back! Please sign in \nto continue.",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Spectral',
                              
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            cursorColor: kPrimaryColor,
                            onSaved: (email) {},
                            decoration: const InputDecoration(
                              hintText: 'Email',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          child: TextFormField(
                            obscureText: _obscureText,
                            controller: passwordController,
                            textInputAction: TextInputAction.done,
                            cursorColor: kPrimaryColor,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Forgot password ",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Hero(
                          tag: "login_btn",
                          child: ElevatedButton(
                            onPressed: () {
                              loginWithEmail(context);
                            },
                            child: Text(
                              "Sign In".toUpperCase(),
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
