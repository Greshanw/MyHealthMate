import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_health_mate/authentication/login_screen.dart';
import 'package:my_health_mate/tabScreens/Home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {

  User? _user;

  Future<void> _getUser() async {
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      _user = user;
    });
  }
  
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  void initState() {
    super.initState();
    _getUser();
    tabController = TabController(length: 3, vsync: this);
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Health Mate"),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children:const [
          // HomeScreen(),
          // MenuScreen(),
          // UserTab(),
          HomePage(),
          Text("MenuScreen"),
          Text("UserScreen")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _signOut,
        tooltip: 'Logout',
        child: Icon(Icons.logout),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 50), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted, size: 50), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, size: 50), label: ''),
        ],
        elevation: 20,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.green,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}