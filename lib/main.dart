import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_health_mate/mainScreens/main_screen.dart';
import 'package:my_health_mate/splashScreen/splash_screen.dart';
import 'package:my_health_mate/tabScreens/Home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Firebase.initializeApp();
  runApp(
    MyApp(
        child: MaterialApp(
            title: 'Health Mate',
            theme: ThemeData(
              primarySwatch: Colors.lightGreen,
            ),
            home: FirebaseAuth.instance.currentUser != null
                ? const MainScreen()
                : const MySplashScreen())),
  );
}

class MyApp extends StatefulWidget {
  //check nullcheck
  final Widget? child;

  const MyApp({super.key, this.child});

  //Method to restarting the app
  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()?.restartApp();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(key: key, child: widget.child!);
  }
}