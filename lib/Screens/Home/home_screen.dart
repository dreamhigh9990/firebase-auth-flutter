import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../components/background.dart';
import '../../responsive.dart';
import 'components/login_signup_btn.dart';
import 'components/welcome_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Responsive(
              desktop: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Expanded(
                    child: WelcomeImage(),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 450,
                          child: LoginAndSignupBtn(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              mobile: const MobileHomeScreen(),
            ),
          ),
        ),
      ),
    );
  }
}

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Hi Sophie, \nYou’ve \nattended 2 \nEngages!",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            Column(
              children: [
                // ElevatedButton(
                //   onPressed: () {
                //     // Navigator.push(
                //     //   context,
                //     //   MaterialPageRoute(
                //     //     builder: (context) {
                //     //       // return LoginScreen();
                //     //     },
                //     //   ),
                //     // );
                //   },
                //   child: Text(
                //     "Login".toUpperCase(),
                //   ),
                // ),
                // const SizedBox(height: 16),
                // ElevatedButton(
                //   onPressed: () {
                //     // Navigator.push(
                //     //   context,
                //     //   MaterialPageRoute(
                //     //     builder: (context) {
                //     //       // return SignUpScreen();
                //     //     },
                //     //   ),
                //     // );
                //   },
                //   style: ElevatedButton.styleFrom(
                //       primary: kPrimaryLightColor, elevation: 0),
                //   child: Text(
                //     "Sign Up".toUpperCase(),
                //     style: TextStyle(color: Colors.black),
                //   ),
                // ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
