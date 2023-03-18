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
        decoration:const  BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/splashScreen.jpg'), fit: BoxFit.cover)),
        child: Center(
            child: Column(
          
          children: [
            const SizedBox(
              height: 250,
            ),
            const Text("Health Mate",
            style: TextStyle(
              fontSize: 30,
              color: Colors.black
            )),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                
                Navigator.push(
                    context, MaterialPageRoute(builder: (c) => LoginScreen()));
              
              },
              child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(45.0),
                              
                            ),
                            child:const  Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.black,
                              size: 65,
                              
                            ),
                          ),
            ),
            ],
        )),
      ),
    );
  }
}
