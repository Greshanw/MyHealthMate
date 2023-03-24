import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_health_mate/authentication/login_screen.dart';
import 'package:my_health_mate/mainScreens/main_screen.dart';

import '../authentication/signup_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() async {
    Timer(const Duration(seconds: 3), () async {
      //send user to home screen
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const MainScreen()));
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   startTimer();
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(

          image: DecorationImage(
              image: AssetImage('images/background.jpg'), fit: BoxFit.cover),
        ),

        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),

            const SizedBox(
              height: 300,
              width: 300,
              child: Image(
                image: AssetImage('images/logo.png'),
                fit: BoxFit.fitWidth,
              ),
              // child: Card(
              //   elevation: 5,
              //   color: Colors.transparent,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(20)),
              //   ),
              //   child: Image(
              //     image: AssetImage('images/logo.png'),
              //     fit: BoxFit.fitWidth,
              //   ),
              // ),
            ),
            // const SizedBox(
            //   height: 50,
            // ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (c) => LoginScreen()));
              },
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  backgroundColor: const Color(0xFF5CB85C),
                  fixedSize: const Size(280, 60)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Get Started",
                    style: TextStyle(fontSize: 32),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 36,
                  ),
                ],
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (c) => LoginScreen()));
            //   },
            //   child: Container(
            //     height: 70,
            //     width: 70,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(45.0),
            //     ),
            //     child: const Icon(
            //       Icons.arrow_forward_rounded,
            //       color: Colors.black,
            //       size: 65,
            //     ),
            //   ),
            // ),
            const Spacer(),
          ],
        )),
      ),
    );
  }
}
