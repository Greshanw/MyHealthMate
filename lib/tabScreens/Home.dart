import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_health_mate/screens/body_weight_tracker/body_weight_tracker.dart';

import '../screens/symptoms_recorder/symptom_recorder_home.dart';
import '../screens/water-drinking-plan/water_drink_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? _user;

  Future<void> _getUser() async {
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      _user = user;
    });
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Welcome, ${_user?.displayName ?? 'Anonymous'}"),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.food_bank),
              tooltip: 'Diet Plan',
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.calculate),
              tooltip: 'Health Calculator',
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BodyWeightTracker()));
              },
              icon: Icon(Icons.water),
              tooltip: 'Water Count',
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SyptomSplash()));
              },
              icon: Icon(Icons.edit),
              tooltip: 'Symptoms Recorder',
            ),
          ],
        )
      ],
    );
  }
}
