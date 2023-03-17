import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_health_mate/authentication/signup_screen.dart';
import 'package:my_health_mate/mainScreens/main_screen.dart';
import 'package:my_health_mate/widgets/progress_dialog.dart';

import '../global/global.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  validateForm() {
    if (!emailTextEditingController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Email address is not valid");
    } else if (passwordTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Password is required.");
    } else {
      loginCustomer();
    }
  }

  loginCustomer() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(
            message: "Processing, Please wait...",
          );
        });
    final User? firebaseUser = (await firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text.trim(),
                password: passwordTextEditingController.text.trim())
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error: " + msg.toString());
    }))
        .user;
    if (firebaseUser != null) {
      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "Login successfully!! ");
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const MainScreen()));
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error occured, durring login ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // const SizedBox(
          //   height: double.maxFinite,
          //   width: double.maxFinite,
          //   child: Image(
          //     image: AssetImage('images/background.png'),
          //     fit: BoxFit.fill,
          //   ),
          // ),
          // Image(
          //   image: AssetImage('images/background.png'),
          //   fit: BoxFit.contain,
          // ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Image(
                        height: 200,
                        image: AssetImage('images/login.png'),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Login as a User',
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.lightGreen)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.lightGreen)),
                      hintText: "Enter your Email",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 16),
                      // hintText: "Email",
                      // enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.lightGreen)),
                      // focusedBorder: UnderlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.lightGreen)),

                      // labelStyle: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordTextEditingController,
                    obscureText: true,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.lightGreen)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.lightGreen)),
                      hintText: "Enter your Password",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 16),
                      // hintText: "Email",
                      // enabledBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.lightGreen)),
                      // focusedBorder: UnderlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.lightGreen)),

                      // labelStyle: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        validateForm();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green[600],
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50)),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: [
                      Text(
                        'Do not have an account? ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => const SignUpScreen()));
                        },
                        child: Text(
                          'Register Here',
                          style: TextStyle(
                              color: Colors.green[600],
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}