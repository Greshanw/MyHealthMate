import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:health_manager_uee_project_2022/screens/water-drinking-plan/waterdrinking_history.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../water-drinking-plan/waterdrinking_history.dart';
//import '../healthy-recipe/components/bottom_nav.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'water_plan.dart';
import 'dart:io';

class WaterDrinkHOME extends StatefulWidget {
  const WaterDrinkHOME({Key? key}) : super(key: key);

  @override
  _WaterLevelState createState() => _WaterLevelState();
}

class _WaterLevelState extends State<WaterDrinkHOME> {
  final CollectionReference _watergoal =
      FirebaseFirestore.instance.collection('watergoal');

  void _navigatetowaterplan(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => waterPlan()));
  }

  void _navigatetowaterhistory(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WaterDrinkingHistory()));
  }

  final TextEditingController _exerciseController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _cupController = TextEditingController();

  double _waterlevel = 0;
  String _textResult = '';
  String _imageresult = "";

  bool colorClick = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.5, 0.67, 0.75, 0.88, 0.92, 0.98],
                colors: (colorClick == false)
                    ? [
                        Colors.white,
                        Colors.red.shade50,
                        Colors.red.shade100,
                        Colors.red.shade200,
                        Colors.red.shade300,
                        Colors.red.shade400,
                      ]
                    : [
                        Colors.white,
                        Colors.grey.shade50,
                        Colors.grey.shade100,
                        Colors.grey.shade200,
                        Colors.grey.shade300,
                        Colors.grey.shade400,
                      ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
                icon: SvgPicture.asset('images/back.svg'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            elevation: 4,
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFF5CB85C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            title: Text(
              "My Health Mate",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
                fontSize: 17,
                color: Color(0xffffffff),
              ),
            ),
          ),
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
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: MaterialButton(
                                onPressed: () async {
                                  _navigatetowaterplan(context);
                                },
                                color: Color(0xffb4b0b7),
                                elevation: 0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
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
                                  (context);
                                },
                                color: Color(0xFF5CB85C),
                                elevation: 0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
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
                        " Calculate Daily Water Goal",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
                              child: Text(
                                "Weight (Kg)",
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                                child: Container(
                                  width: 145,
                                  child: TextField(
                                    controller: _weightController,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blueGrey.shade800),
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        // hintText: "Weight(kg)",
                                        hintStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    )),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: Row(children: [
                          Text(
                            " Daily Exersice Time\n(min)",
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                            child: Container(
                              width: 145,
                              child: TextField(
                                controller: _exerciseController,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blueGrey.shade800),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    // hintText: "Exersice Time \n per day (min)",
                                    hintStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                )),
                              ),
                            ),
                          )
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                              child: Text(
                                "Your cup size",
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                                child: Container(
                                  width: 145,
                                  child: TextField(
                                    controller: _cupController,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blueGrey.shade800),
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        // hintText: "Weight(kg)",
                                        hintStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    )),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            if (_exerciseController.text == "" ||
                                _weightController.text == "" ||
                                _cupController.text == "") {
                              _textResult = "Required fileds are missing ";
                              _imageresult = "";
                              colorClick = false;
                            } else {
                              double _cup = double.parse(_cupController.text);
                              double _exercise =
                                  double.parse(_exerciseController.text);
                              double _weight =
                                  double.parse(_weightController.text);

                              _waterlevel = ((_weight * 0.033) +
                                      ((_exercise / 30) * 0.35)) *
                                  1000;
                              _textResult =
                                  "You must drink $_waterlevel  ml per day";
                              _imageresult = "images/waterlevel.gif";
                              colorClick = true;

                              addwaterlevel(_waterlevel, _cup);
                              _watergoal.doc("watergoal").update({
                                "watergoal": _waterlevel,
                              });
                            }
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 90, vertical: 8),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFF5CB85C),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          alignment: Alignment.center,
                          child: const Text("Calulate",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        _waterlevel.toStringAsFixed(2) + " ml",
                        style: TextStyle(
                            fontSize: 30, color: Colors.grey.shade900),
                      ),
                      Visibility(
                        visible: _textResult.isNotEmpty,
                        child: Text(
                          _textResult,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade800,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Visibility(
                          visible: _imageresult.isNotEmpty,
                          child: Image(
                            image: AssetImage(_imageresult),
                            height: 240.0,
                            width: 180.0,
                          ))
                    ],
                  ))),
        ));
  }

  Future<void> addwaterlevel(_waterlevel, cup) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('_waterlevel', _waterlevel);
    prefs.setDouble('cup', cup);
  }
}

//Water Drink Splash Screen
class WaterSplash extends StatefulWidget {
  const WaterSplash({Key? key}) : super(key: key);

  @override
  State<WaterSplash> createState() => _WaterSplashState();
}

class _WaterSplashState extends State<WaterSplash> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WaterDrinkHOME()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5CB85C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/heart.png',
              height: 130,
            ),
            const SizedBox(
              height: 30,
            ),
            if (Platform.isIOS)
              const CupertinoActivityIndicator(
                radius: 15,
              )
            else
              const CircularProgressIndicator(
                color: Colors.white,
              )
          ],
        ),
      ),
    );
  }
}
