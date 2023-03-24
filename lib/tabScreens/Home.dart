import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_health_mate/screens/body_weight_tracker/body_weight_tracker.dart';
import '../screens/diet_plan/diet_plan_home.dart';
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
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: 16,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  ),
                ],
              ),
            ),
          ),

          //Diet Plan
          Expanded(
            flex: 1,
            child: GridView(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 0,
                childAspectRatio: 0.55,
              ),
              children: [
                Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          GestureDetector(
                            onTap: () {
                              // _navigateToDietPlanHome(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DietPlanHOME()));
                            }, // Image tapped
                            child: Image(
                              //image: AssetImage('assets/diet01.png'),
                              image: NetworkImage(
                                  "https://cdn-icons-png.flaticon.com/512/6485/6485800.png"),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Diet Plan",
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 4, 0, 8),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Body Weight Tracker
                Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const BodyWeightTracker()));
                            }, // Image tapped
                            child: Image(
                              //image: AssetImage('assets/diet01.png'),
                              image: NetworkImage(
                                  "https://cdn-icons-png.flaticon.com/512/9839/9839840.png"),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Body Weight Tracker",
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 4, 0, 8),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Water Drinking Plan
                Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const WaterDrinkHOME()));
                            }, // Image tapped
                            child: Image(
                              //image: AssetImage('assets/diet01.png'),
                              image: NetworkImage(
                                  "https://cdn-icons-png.flaticon.com/512/9839/9839895.png"),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Water Drinking Plan",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 4, 0, 8),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Symptom Recorder
                Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          GestureDetector(
                            onTap: () {
                              _navigateToSymptomRecordHome(context);
                            }, // Image tapped
                            child: Image(
                              //image: AssetImage('assets/diet01.png'),
                              image: NetworkImage(
                                  "https://cdn-icons-png.flaticon.com/512/4534/4534984.png"),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Symptom Record",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 4, 0, 8),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToDietPlanHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DietSplash()));
  }

  // void _navigateToWaterDrinkingPlanHome(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => WaterSplash()));
  // }

  void _navigateToSymptomRecordHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SyptomSplash()));
  }

  // void _navigateToBodyWeightTrackerHome(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => BWTSplash()));
  // }
}
