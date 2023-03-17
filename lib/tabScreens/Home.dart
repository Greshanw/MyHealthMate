import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    return Center(
      child: Text("Welcome, ${_user?.displayName ?? 'Anonymous'}"),
    );
  }
}
