import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/diet_plan/diet_plan_home.dart';
import '../screens/symptoms_recorder/symptom_recorder_home.dart';

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
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DietPlanHOME()));
              },
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
              onPressed: () {},
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
