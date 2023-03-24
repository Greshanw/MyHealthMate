import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health_mate/screens/symptoms_recorder/symptoms_head_history.dart';

class HeadSymptomsPage extends StatefulWidget {
  const HeadSymptomsPage({Key? key}) : super(key: key);

  @override
  _HeadSymptomsState createState() => _HeadSymptomsState();
}

class _HeadSymptomsState extends State<HeadSymptomsPage> {
  void _navigateToSymptomHistory(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SymptomsHeadHistory()));
  }

  // Get the current user's UID
  String uid = FirebaseAuth.instance.currentUser!.uid;

  final CollectionReference _symptoms =
      FirebaseFirestore.instance.collection('symptoms');

  double symptomlevel1 = 0;
  double symptomlevel2 = 0;
  double symptomlevel3 = 0;
  double symptomlevel4 = 0;
  double symptomlevel5 = 0;

  String symptom = "";

  String textResult = '';
  String imageresult = "";

  bool colorClick = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.6, 0.7, 0.8, 0.88, 0.95, 0.98],
                colors: (symptomlevel1 == 1 || symptomlevel2 == 1|| symptomlevel3 ==1|| symptomlevel4 == 1|| symptomlevel5 == 1)
                    ? [
                        Colors.white,
                        Colors.lightGreen.shade50,
                        Colors.lightGreen.shade100,
                        Colors.lightGreen.shade200,
                        Colors.lightGreen.shade300,
                        Colors.lightGreenAccent.shade400,
                      ]
                    : (symptomlevel1 == 2 || symptomlevel2 == 2|| symptomlevel3 ==2|| symptomlevel4 == 2|| symptomlevel5 == 2)
                        ? [
                            Colors.white,
                            Colors.yellow.shade50,
                            Colors.yellow.shade100,
                            Colors.yellow.shade200,
                            Colors.yellow.shade300,
                            Colors.yellow.shade400,
                          ]
                        : (symptomlevel1 == 3 || symptomlevel2 == 3|| symptomlevel3 ==3|| symptomlevel4 == 3|| symptomlevel5 == 3)
                            ? [
                                Colors.white,
                                Colors.amber.shade50,
                                Colors.amber.shade100,
                                Colors.amber.shade200,
                                Colors.amber.shade300,
                                Colors.amber.shade500,
                              ]
                            : (symptomlevel1 == 4 || symptomlevel2 == 4|| symptomlevel3 ==4|| symptomlevel4 == 4|| symptomlevel5 == 4)
                                ? [
                                    Colors.white,
                                    Colors.orange.shade50,
                                    Colors.orange.shade100,
                                    Colors.orange.shade200,
                                    Colors.orange.shade300,
                                    Colors.orange.shade800,
                                  ]
                                : (symptomlevel1 == 5 || symptomlevel2 == 5|| symptomlevel3 == 5|| symptomlevel4 == 5|| symptomlevel5 == 5)
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
          //backgroundColor: Color(0xffffffff),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: Container(
                height: 32,
                width: 32,
                child: const CircleAvatar(
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
            elevation: 4,
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFF5CB85C),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            title: const Text(
              "Head Symptoms",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
                fontSize: 18,
                color: Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  shrinkWrap: false,
                  physics: const ScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            width: 7,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: MaterialButton(
                              onPressed: () async {},
                              color: const Color(0xFF5CB85C),
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              textColor: Color(0xff000000),
                              height: 40,
                              minWidth: 190,
                              child: const Text(
                                "Symptoms",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: MaterialButton(
                              onPressed: () async {
                                _navigateToSymptomHistory(context);
                              },
                              color: const Color(0xffb4b0b7),
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              textColor: Color(0xff000000),
                              height: 40,
                              minWidth: 190,
                              child: const Text(
                                "History",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(90, 20, 20, 40),
                      child: Text(
                        "Head Symptoms",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 25,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
                            child: Text(
                              "Headache",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: SliderTheme(
                              data: SliderThemeData(
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 12,
                                  disabledThumbRadius: 12,
                                  elevation: 4,
                                  pressedElevation: 6,
                                ),
                                activeTrackColor: const Color(0xFF5CB85C),
                                inactiveTrackColor: Colors.grey,
                                overlayColor:
                                    const Color(0xFF5CB85C).withOpacity(0.2),
                                thumbColor: const Color(0xFF5CB85C),
                                valueIndicatorColor: const Color(0xFF5CB85C),
                                valueIndicatorTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: Slider(
                                value: symptomlevel1.toDouble(),
                                min: 0,
                                max: 5,
                                divisions: 5,
                                label: 'Headache: $symptomlevel1',
                                onChanged: (double value) {
                                  setState(() {
                                    symptomlevel1 = value.toDouble();
                                    symptom = 'Headache';
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: Text(
                              "Migraines",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: SliderTheme(
                              data: SliderThemeData(
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 12,
                                  disabledThumbRadius: 12,
                                  elevation: 4,
                                  pressedElevation: 6,
                                ),
                                activeTrackColor: const Color(0xFF5CB85C),
                                inactiveTrackColor: Colors.grey,
                                overlayColor:
                                    const Color(0xFF5CB85C).withOpacity(0.2),
                                thumbColor: const Color(0xFF5CB85C),
                                valueIndicatorColor: const Color(0xFF5CB85C),
                                valueIndicatorTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: Slider(
                                value: symptomlevel2.toDouble(),
                                min: 0,
                                max: 5,
                                divisions: 5,
                                label: 'Migraines: $symptomlevel2',
                                onChanged: (double value) {
                                  setState(() {
                                    symptomlevel2 = value.toDouble();
                                    symptom = 'Migraines';
                                  });
                                },
                              ),
                            ) 
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: Text(
                              "Dizziness",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: SliderTheme(
                              data: SliderThemeData(
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 12,
                                  disabledThumbRadius: 12,
                                  elevation: 4,
                                  pressedElevation: 6,
                                ),
                                activeTrackColor: const Color(0xFF5CB85C),
                                inactiveTrackColor: Colors.grey,
                                overlayColor:
                                    const Color(0xFF5CB85C).withOpacity(0.2),
                                thumbColor: const Color(0xFF5CB85C),
                                valueIndicatorColor: const Color(0xFF5CB85C),
                                valueIndicatorTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: Slider(
                                value: symptomlevel3.toDouble(),
                                min: 0,
                                max: 5,
                                divisions: 5,
                                label: 'Dizziness: $symptomlevel3',
                                onChanged: (double value) {
                                  setState(() {
                                    symptomlevel3 = value.toDouble();
                                    symptom = 'Dizziness';
                                  });
                                },
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                  child: Text(
                                    "Problems with ",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                  "balance",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: SliderTheme(
                              data: SliderThemeData(
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 12,
                                  disabledThumbRadius: 12,
                                  elevation: 4,
                                  pressedElevation: 6,
                                ),
                                activeTrackColor: const Color(0xFF5CB85C),
                                inactiveTrackColor: Colors.grey,
                                overlayColor:
                                    const Color(0xFF5CB85C).withOpacity(0.2),
                                thumbColor: const Color(0xFF5CB85C),
                                valueIndicatorColor: const Color(0xFF5CB85C),
                                valueIndicatorTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: Slider(
                                value: symptomlevel4.toDouble(),
                                min: 0,
                                max: 5,
                                divisions: 5,
                                label: 'Problems with balance: $symptomlevel4',
                                onChanged: (double value) {
                                  setState(() {
                                    symptomlevel4 = value.toDouble();
                                    symptom = 'Problems with balance';
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: Text(
                              "Hectic fever",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: SliderTheme(
                              data: SliderThemeData(
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 12,
                                  disabledThumbRadius: 12,
                                  elevation: 4,
                                  pressedElevation: 6,
                                ),
                                activeTrackColor: const Color(0xFF5CB85C),
                                inactiveTrackColor: Colors.grey,
                                overlayColor:
                                    const Color(0xFF5CB85C).withOpacity(0.2),
                                thumbColor: const Color(0xFF5CB85C),
                                valueIndicatorColor: const Color(0xFF5CB85C),
                                valueIndicatorTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: Slider(
                                value: symptomlevel5.toDouble(),
                                min: 0,
                                max: 5,
                                divisions: 5,
                                label: 'Hectic fever: $symptomlevel5',
                                onChanged: (double value) {
                                  setState(() {
                                    symptomlevel5 = value.toDouble();
                                    symptom = 'Hectic fever';
                                  });
                                },
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Visibility(
                        visible: textResult.isNotEmpty,
                        child: DottedBorder(
                          dashPattern:const [6, 3, 2, 3],
                          color: ((symptomlevel1 == 1 || symptomlevel2 == 1|| symptomlevel3 ==1|| symptomlevel4 == 1|| symptomlevel5 == 1)
                              ? Colors.lightGreenAccent
                              : (symptomlevel1 == 2 || symptomlevel2 == 2|| symptomlevel3 ==2|| symptomlevel4 == 2|| symptomlevel5 == 2)
                                  ? Colors.yellow
                                  : (symptomlevel1 == 3 || symptomlevel2 == 3|| symptomlevel3 ==3|| symptomlevel4 == 3|| symptomlevel5 == 3)
                                      ? Colors.amber
                                      : (symptomlevel1 == 4 || symptomlevel2 == 4|| symptomlevel3 ==4|| symptomlevel4 == 4|| symptomlevel5 == 4)
                                          ? Colors.orange
                                          : (symptomlevel1 == 5 || symptomlevel2 == 5|| symptomlevel3 ==5|| symptomlevel4 == 5|| symptomlevel5 == 5)
                                              ? Colors.red
                                              : Colors.black),
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(12),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(children: [
                                Visibility(
                                  visible: textResult.isNotEmpty,
                                  child: Text(
                                    textResult,
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
                                    visible: imageresult.isNotEmpty,
                                    child: Image(
                                      image: AssetImage(imageresult),
                                      height: 40.0,
                                      width: 40.0,
                                    ))
                              ])),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(80, 20, 88, 0),
                      child: MaterialButton(
                        onPressed: () async {
                          if (symptomlevel1 > 0 || symptomlevel2 > 0|| symptomlevel3 > 0|| symptomlevel4 > 0|| symptomlevel5 > 0) {
                            double highestSymptomLevel = 0;
                            if (symptomlevel1 > 0) {
                              highestSymptomLevel = symptomlevel1;
                            }
                            if (symptomlevel2 > 0 && symptomlevel2 > highestSymptomLevel) {
                              highestSymptomLevel = symptomlevel2;
                            }
                            if (symptomlevel3 > 0 && symptomlevel3 > highestSymptomLevel) {
                              highestSymptomLevel = symptomlevel3;
                            }
                            if (symptomlevel4 > 0 && symptomlevel4 > highestSymptomLevel) {
                              highestSymptomLevel = symptomlevel4;
                            }
                            if (symptomlevel5 > 0 && symptomlevel5 > highestSymptomLevel) {
                              highestSymptomLevel = symptomlevel5;
                            }
                            // Create a new document in the 'DoctorTreatements' collection with the current user's UID as the document ID
                            CollectionReference userHeadSymptomsRef = _symptoms
                                .doc(uid)
                                .collection("userHeadSymptoms");
                            await userHeadSymptomsRef.add({
                              "symptom": symptom,
                              "symptomlevel": highestSymptomLevel,
                              'timestamp': DateTime.now()
                            }).then((value) {
                              Get.snackbar(
                                  "Success", 'Data stored successfully',
                                  backgroundColor:
                                      const Color.fromARGB(100, 22, 44, 33));
                            });
                          }
                          setState(() {
                            if (symptomlevel1 == 0 && symptomlevel2 == 0&& symptomlevel3 ==0&& symptomlevel4 ==0&& symptomlevel5 == 0) {
                              textResult = 'Rate your pain before submitting';
                              imageresult = "";
                            } else if (symptomlevel1 == 1 || symptomlevel2 == 1|| symptomlevel3 ==1|| symptomlevel4 == 1|| symptomlevel5 == 1) {
                              textResult =
                                  'You are in mild pain \n  Feel better soon!';
                              imageresult = "images/pain1.png";
                              colorClick = false;
                            } else if (symptomlevel1 == 2 || symptomlevel2 == 2|| symptomlevel3 ==2|| symptomlevel4 == 2|| symptomlevel5 == 2) {
                              textResult =
                                  ' You are in moderate pain \n Feel better soon!';
                              imageresult = "images/pain2.png";
                            } else if (symptomlevel1 == 3 || symptomlevel2 == 3|| symptomlevel3 ==3|| symptomlevel4 == 3|| symptomlevel5 == 3) {
                              textResult =
                                  ' you are severe pain \n Feel better soon!';
                              imageresult = "images/pain3.png";
                            } else if (symptomlevel1 == 4 || symptomlevel2 == 4|| symptomlevel3 ==4|| symptomlevel4 == 4|| symptomlevel5 == 4) {
                              textResult =
                                  'You are in very severe pain \n Feel better soon!';
                              imageresult = "images/pain4.png";
                            } else if (symptomlevel1 == 5 || symptomlevel2 == 5|| symptomlevel3 ==5|| symptomlevel4 == 5|| symptomlevel5 == 5) {
                              textResult =
                                  'You are in worst pain posible \n Feel better soon!';
                              imageresult = "images/pain5.png";
                            }
                          });
                        },
                        color: const Color(0xFF5CB85C),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Color(0xff808080), width: 1),
                        ),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        textColor: const Color(0xff000000),
                        height: 40,
                        minWidth: 140,
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
