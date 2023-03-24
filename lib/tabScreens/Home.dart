import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                              _navigateToDietPlanHome(context);
                            }, // Image tapped
                            child: Image(
                              //image: AssetImage('assets/diet01.png'),
                              image: NetworkImage(
                                  "https://thumbs.dreamstime.com/b/diet-plan-sign-button-leaves-vector-97428612.jpg"),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
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

                //Body Weight Tracker
                // Container(
                //   margin: EdgeInsets.all(0),
                //   padding: EdgeInsets.all(0),
                //   width: 200,
                //   height: 100,
                //   decoration: BoxDecoration(
                //     color: Color(0xffffffff),
                //     shape: BoxShape.rectangle,
                //     borderRadius: BorderRadius.zero,
                //   ),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisSize: MainAxisSize.max,
                //     children: [
                //       Stack(
                //         alignment: Alignment.topRight,
                //         children: [
                //           ///***If you have exported images you must have to copy those images in assets/images directory.
                //           GestureDetector(
                //             onTap: () {
                //               _navigateToBodyWeightTrackerHome(context);
                //             }, // Image tapped
                //             child: Image(
                //               //image: AssetImage('assets/diet01.png'),
                //               image: NetworkImage(
                //                   "https://a0.anyrgb.com/pngimg/1318/1900/human-body-weight-balans-measuring-scales-justice-measurement-weight-human-body-map-diagram-red.png"),
                //               height: MediaQuery.of(context).size.height * 0.2,
                //               width: MediaQuery.of(context).size.width,
                //               fit: BoxFit.cover,
                //             ),
                //           )
                //         ],
                //       ),
                //       Expanded(
                //         flex: 1,
                //         child: Padding(
                //           padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisSize: MainAxisSize.max,
                //             children: [
                //               Text(
                //                 "Body Weight Tracker",
                //                 textAlign: TextAlign.start,
                //                 maxLines: 1,
                //                 overflow: TextOverflow.clip,
                //                 style: TextStyle(
                //                   fontWeight: FontWeight.w700,
                //                   fontStyle: FontStyle.normal,
                //                   fontSize: 14,
                //                   color: Color(0xff000000),
                //                 ),
                //               ),
                //               Padding(
                //                 padding: EdgeInsets.fromLTRB(0, 4, 0, 8),
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 mainAxisSize: MainAxisSize.min,
                //                 children: [],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                //Water Drinking Plan
                // Container(
                //   margin: EdgeInsets.all(0),
                //   padding: EdgeInsets.all(0),
                //   width: 200,
                //   height: 100,
                //   decoration: BoxDecoration(
                //     color: Color(0xffffffff),
                //     shape: BoxShape.rectangle,
                //     borderRadius: BorderRadius.zero,
                //   ),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisSize: MainAxisSize.max,
                //     children: [
                //       Stack(
                //         alignment: Alignment.topRight,
                //         children: [
                //           ///***If you have exported images you must have to copy those images in assets/images directory.
                //           GestureDetector(
                //             onTap: () {
                //               _navigateToWaterDrinkingPlanHome(context);
                //             }, // Image tapped
                //             child: Image(
                //               //image: AssetImage('assets/diet01.png'),
                //               image: NetworkImage(
                //                   "https://www.pinclipart.com/picdir/big/460-4608436_long-term-use-of-ionized-alkaline-water-is.png"),
                //               height: MediaQuery.of(context).size.height * 0.2,
                //               width: MediaQuery.of(context).size.width,
                //               fit: BoxFit.cover,
                //             ),
                //           )
                //         ],
                //       ),
                //       Expanded(
                //         flex: 1,
                //         child: Padding(
                //           padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisSize: MainAxisSize.max,
                //             children: [
                //               Text(
                //                 "Water Drinking Plan",
                //                 textAlign: TextAlign.start,
                //                 overflow: TextOverflow.clip,
                //                 style: TextStyle(
                //                   fontWeight: FontWeight.w700,
                //                   fontStyle: FontStyle.normal,
                //                   fontSize: 14,
                //                   color: Color(0xff000000),
                //                 ),
                //               ),
                //               Padding(
                //                 padding: EdgeInsets.fromLTRB(0, 4, 0, 8),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

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
                                  "https://www.bannerhealth.com/-/media/images/project/healthcareblog/hero-images/2022/03/signs-of-severe-brain-injury-from-bumping-head.ashx?h=780&w=1170&hash=7EF60D33323D67A79535EF7F84CBDFC6"),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
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
