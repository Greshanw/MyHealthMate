import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_health_mate/authentication/login_screen.dart';
import 'package:my_health_mate/global/global.dart';
import 'package:my_health_mate/mainScreens/main_screen.dart';
import 'package:my_health_mate/splashScreen/splash_screen.dart';
import 'package:my_health_mate/widgets/progress_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  validateForm() {
    if (!emailTextEditingController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Email address is not valid");
    } else if (phoneTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Phone number is mandatory");
    } else if (passwordTextEditingController.text.length < 6) {
      Fluttertoast.showToast(
          msg: "Password must be greater than 6 characters.");
    } else {
      saveUserData();
    }
  }

  saveUserData() async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext c) {
      return ProgressDialog(
        message: "Registering, Please Wait!!",
      );
    });

  final User? firebaseUser = (await firebaseAuth
      .createUserWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim())
      .catchError((msg) {
    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Error: " + msg.toString());
  }))
      .user;

  if (firebaseUser != null) {
    // Set the display name property

    await firebaseUser.updateProfile(
    displayName: nameTextEditingController.text.trim(),
  );

    Map customerMap = {
      "id": firebaseUser.uid,
      "name": nameTextEditingController.text.trim(),
      "email": emailTextEditingController.text.trim(),
      "phone": phoneTextEditingController.text.trim(),
    };

    DatabaseReference customerReference =
        FirebaseDatabase.instance.ref().child("customers");
    customerReference.child(firebaseUser.uid).set(customerMap);

    currentFirebaseUser = firebaseUser;
    Fluttertoast.showToast(msg: "Account has been created ");
    Navigator.push(
        context, MaterialPageRoute(builder: (c) => MainScreen()));
  } else {
    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Account has not been created ");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Image(
                      height: 120,
                      image: AssetImage('images/welcome.png'),
                    )),
                const Text(
                  'Create an account',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: nameTextEditingController,
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
                    hintText: "Enter your Name",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  //   decoration: const InputDecoration(
                  //       labelText: "Name",
                  //       hintText: "Name",
                  //       enabledBorder: UnderlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.lightGreen)),
                  //       focusedBorder: UnderlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.lightGreen)),
                  //       hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  //       labelStyle: TextStyle(
                  //           color: Colors.black,
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.bold)),
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
                  ),
                  // decoration: const InputDecoration(
                  //     labelText: "Email",
                  //     hintText: "Email",
                  //     enabledBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.lightGreen)),
                  //     focusedBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.lightGreen)),
                  //     hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  //     labelStyle: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: phoneTextEditingController,
                  keyboardType: TextInputType.phone,
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
                    hintText: "Enter Phone Number",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  // decoration: const InputDecoration(
                  //     labelText: "Phone Number",
                  //     hintText: "Phone Number",
                  //     enabledBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.lightGreen)),
                  //     focusedBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.lightGreen)),
                  //     hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  //     labelStyle: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.bold)),
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
                  ),
                  // decoration: const InputDecoration(
                  //     labelText: "Password",
                  //     hintText: "Password",
                  //     enabledBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.lightGreen)),
                  //     focusedBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.lightGreen)),
                  //     hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  //     labelStyle: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      validateForm();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green[600],
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: [
                    Text(
                      'Already have an Acoount? ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => LoginScreen()));
                      },
                      child: Text(
                        'Login Here',
                        style: TextStyle(
                            color: Colors.green[600],
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                // TextButton(
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (c) => LoginScreen()));
                //     },
                //     child: Text(
                //       'Already have an Acoount? Login Here',
                //       style: TextStyle(color: Colors.grey),
                //     ))
              ],
            ),
          )),
        ],
      ),
    );
  }
}
