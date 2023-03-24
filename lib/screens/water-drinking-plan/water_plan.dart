import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import '../healthy-recipe/components/bottom_nav.dart';
import 'water_drink_home.dart';
import 'waterdrinking_history.dart';

class waterPlan extends StatefulWidget {
  const waterPlan({Key? key}) : super(key: key);

  @override
  _waterPlanState createState() => _waterPlanState();
}

class _waterPlanState extends State<waterPlan> {
  double? watergoal = 0;
  double? cup = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDoubleValuesSF();
  }

  double _counter = 0;

  void _incrementCounter(cup) {
    setState(() {
      _counter = _counter + cup;

      // _counter++;
    });
  }

  void _navigatetowaterhistory(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WaterDrinkingHistory()));
  }

  void _navigatetowatergoal(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WaterDrinkHOME()));
  }

  final CollectionReference _waterintake =
      FirebaseFirestore.instance.collection('DailyWaterIntake');

  void getDoubleValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    watergoal = prefs.getDouble('_waterlevel');
    cup = prefs.getDouble('cup');
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const SizedBox(
              height: 32,
              width: 32,
              child: CircleAvatar(
                  child: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.black,
                size: 18,
              )),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            "Water Drinking Plan",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.normal,
              fontSize: 18,
              color: Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
          elevation: 4,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF5CB85C),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          )),
      // appBar: AppBar(
      //   leading: IconButton(
      //       icon: SvgPicture.asset('images/back.svg'),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       }),
      //   elevation: 4,
      //   centerTitle: false,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Color(0xFF5CB85C),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.zero,
      //   ),
      //   title: Text(
      //     "My Health Mate",
      //     style: TextStyle(
      //       fontWeight: FontWeight.w800,
      //       fontStyle: FontStyle.normal,
      //       fontSize: 17,
      //       color: Color(0xffffffff),
      //     ),
      //   ),
      // ),
      //bottomNavigationBar: BottomNavBar(),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: MaterialButton(
                        onPressed: () async {},
                        color: Color(0xffb4b0b7),
                        elevation: 0,
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: Text(
                          "Daily Plan",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        textColor: Color(0xff000000),
                        height: 40,
                        minWidth: 127,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: MaterialButton(
                        onPressed: () async {
                          _navigatetowaterhistory(context);
                        },
                        color: Color(0xfce8ddfa),
                        elevation: 0,
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: Text(
                          "History",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        textColor: Color(0xff000000),
                        height: 40,
                        minWidth: 127,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: MaterialButton(
                        onPressed: () async {
                          _navigatetowatergoal(context);
                        },
                        color: Color(0xFF5CB85C),
                        elevation: 0,
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: Text(
                          "Water Goal",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        textColor: Color(0xff000000),
                        height: 40,
                        minWidth: 127,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Daily Water Drinking Plan",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Your Daily Water Goal :" + watergoal.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                    color: Colors.black,
                  )),
              const SizedBox(
                height: 20,
              ),
              CircularPercentIndicator(
                animation: true,
                animationDuration: 1000,
                radius: 100,
                lineWidth: 20,
                percent: (double.parse(
                            (((_counter / watergoal!)).toStringAsFixed(1))) >
                        1)
                    ? 1
                    : double.parse(
                        (((_counter / watergoal!)).toStringAsFixed(1))),
                progressColor: Colors.blueAccent,
                backgroundColor: Colors.blue.shade100,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  ((_counter / watergoal!) * 100).toStringAsFixed(1) + "%",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                onPressed: () => _incrementCounter(cup!),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "You have taken " + '$_counter' + "ml",
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                "Your cup size " + '$cup' + "ml",
                style: Theme.of(context).textTheme.headline6,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: MaterialButton(
                  onPressed: () async {
                    await _waterintake.add({
                      "Goal": watergoal,
                      "waterintake": _counter,
                      'timestamp': Timestamp.now()
                    }).then((value) {
                      Get.snackbar("Success", 'Data stored successfully',
                          backgroundColor: Color.fromARGB(100, 22, 44, 33));
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const WaterDrinkingHistory()));
                  },
                  color: Color(0xFF5CB85C),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    "Save your water drinking level daily",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  textColor: Color(0xff000000),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
