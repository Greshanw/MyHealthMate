///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_health_mate/screens/symptoms_recorder/symptoms_abdomen_history.dart';

class AbdomenSymptomsPage extends StatefulWidget {
  const AbdomenSymptomsPage({Key? key}) : super(key: key);

  @override
  _AbdomenSymptomsState createState() => _AbdomenSymptomsState();
}

class _AbdomenSymptomsState extends State<AbdomenSymptomsPage> {
  // Get the current user's UID
  String uid = FirebaseAuth.instance.currentUser!.uid;

  final CollectionReference _symptoms =
      FirebaseFirestore.instance.collection('symptoms');

  void _navigateToSymptomHistory(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SymptomsAbdomenHistory()));
  }

  double symptomlevel1 = 0;
  double symptomlevel2 = 0;
  double symptomlevel3 = 0;
  double symptomlevel4 = 0;
  double symptomlevel5 = 0;
  double symptomlevel6 = 0;
  double symptomlevel7 = 0;
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
                colors: (symptomlevel1 == 1 ||
                        symptomlevel2 == 1 ||
                        symptomlevel3 == 1 ||
                        symptomlevel4 == 1 ||
                        symptomlevel5 == 1 ||
                        symptomlevel6 == 1)
                    ? [
                        Colors.white,
                        Colors.lightGreen.shade50,
                        Colors.lightGreen.shade100,
                        Colors.lightGreen.shade200,
                        Colors.lightGreen.shade300,
                        Colors.lightGreenAccent.shade400,
                      ]
                    : (symptomlevel1 == 2 ||
                            symptomlevel2 == 2 ||
                            symptomlevel3 == 2 ||
                            symptomlevel4 == 2 ||
                            symptomlevel5 == 2)
                        ? [
                            Colors.white,
                            Colors.yellow.shade50,
                            Colors.yellow.shade100,
                            Colors.yellow.shade200,
                            Colors.yellow.shade300,
                            Colors.yellow.shade400,
                          ]
                        : (symptomlevel1 == 3 ||
                                symptomlevel2 == 3 ||
                                symptomlevel3 == 3 ||
                                symptomlevel4 == 3 ||
                                symptomlevel5 == 3)
                            ? [
                                Colors.white,
                                Colors.amber.shade50,
                                Colors.amber.shade100,
                                Colors.amber.shade200,
                                Colors.amber.shade300,
                                Colors.amber.shade500,
                              ]
                            : (symptomlevel1 == 4 ||
                                    symptomlevel2 == 4 ||
                                    symptomlevel3 == 4 ||
                                    symptomlevel4 == 4 ||
                                    symptomlevel5 == 4)
                                ? [
                                    Colors.white,
                                    Colors.orange.shade50,
                                    Colors.orange.shade100,
                                    Colors.orange.shade200,
                                    Colors.orange.shade300,
                                    Colors.orange.shade800,
                                  ]
                                : (symptomlevel1 == 5 ||
                                        symptomlevel2 == 5 ||
                                        symptomlevel3 == 5 ||
                                        symptomlevel4 == 5 ||
                                        symptomlevel5 == 5)
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
              icon: Container(
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
            elevation: 4,
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFF5CB85C),
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
                  physics: ScrollPhysics(),
                  children: [
                    SizedBox(
                      width: 7,
                    ),
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
                              onPressed: () async {},
                              color: Color(0xFF5CB85C),
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              child: Text(
                                "symptoms",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              textColor: Color(0xff000000),
                              height: 40,
                              minWidth: 190,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: MaterialButton(
                              onPressed: () async {
                                _navigateToSymptomHistory(context);
                              },
                              color: Color(0xffb4b0b7),
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              child: Text(
                                " History",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              textColor: Color(0xff000000),
                              height: 40,
                              minWidth: 190,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(90, 10, 20, 30),
                      child: Text(
                        "Abdomen Symptoms",
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
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: Text(
                              "Bloating",
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
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: SliderTheme(
                                data: SliderThemeData(
                                  thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 12,
                                    disabledThumbRadius: 12,
                                    elevation: 4,
                                    pressedElevation: 6,
                                  ),
                                  activeTrackColor: Color(0xFF5CB85C),
                                  inactiveTrackColor: Colors.grey,
                                  overlayColor:
                                      Color(0xFF5CB85C).withOpacity(0.2),
                                  thumbColor: Color(0xFF5CB85C),
                                  valueIndicatorColor: Color(0xFF5CB85C),
                                  valueIndicatorTextStyle: TextStyle(
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
                                  label: 'Bloating: $symptomlevel1',
                                  onChanged: (double value) {
                                    setState(() {
                                      symptomlevel1 = value.toDouble();
                                      symptom = 'Bloating';
                                    });
                                  },
                                ),
                              )),
                          // Padding(
                          //   padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          //   child: RatingBar.builder(
                          //     initialRating: 0,
                          //     unratedColor: Color(0xffece5e5),
                          //     itemBuilder: (context, index) =>
                          //         Icon(Icons.star, color: Color(0xffffc107)),
                          //     itemCount: 5,
                          //     itemSize: 30,
                          //     direction: Axis.horizontal,
                          //     allowHalfRating: false,
                          //     onRatingUpdate: (value) {
                          //       if (value > 0) {
                          //         symptomlevel = value;
                          //         symptom = "Bloating";
                          //       }
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: Text(
                              "Constipation",
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
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: SliderTheme(
                                data: SliderThemeData(
                                  thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 12,
                                    disabledThumbRadius: 12,
                                    elevation: 4,
                                    pressedElevation: 6,
                                  ),
                                  activeTrackColor: Color(0xFF5CB85C),
                                  inactiveTrackColor: Colors.grey,
                                  overlayColor:
                                      Color(0xFF5CB85C).withOpacity(0.2),
                                  thumbColor: Color(0xFF5CB85C),
                                  valueIndicatorColor: Color(0xFF5CB85C),
                                  valueIndicatorTextStyle: TextStyle(
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
                                  label: 'Constipation: $symptomlevel2',
                                  onChanged: (double value) {
                                    setState(() {
                                      symptomlevel2 = value.toDouble();
                                      symptom = 'Constipation';
                                    });
                                  },
                                ),
                              )),
                          // Padding(
                          //   padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                          //   child: RatingBar.builder(
                          //     initialRating: 0,
                          //     unratedColor: Color(0xffece5e5),
                          //     itemBuilder: (context, index) =>
                          //         Icon(Icons.star, color: Color(0xffffc107)),
                          //     itemCount: 5,
                          //     itemSize: 30,
                          //     direction: Axis.horizontal,
                          //     allowHalfRating: false,
                          //     onRatingUpdate: (value) {
                          //       if (value > 0) {
                          //         symptomlevel = value;
                          //         symptom = "Constipation";
                          //       }
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: Text(
                              "Diarrhea",
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
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: SliderTheme(
                                data: SliderThemeData(
                                  thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 12,
                                    disabledThumbRadius: 12,
                                    elevation: 4,
                                    pressedElevation: 6,
                                  ),
                                  activeTrackColor: Color(0xFF5CB85C),
                                  inactiveTrackColor: Colors.grey,
                                  overlayColor:
                                      Color(0xFF5CB85C).withOpacity(0.2),
                                  thumbColor: Color(0xFF5CB85C),
                                  valueIndicatorColor: Color(0xFF5CB85C),
                                  valueIndicatorTextStyle: TextStyle(
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
                                  label: 'Diarrhea: $symptomlevel3',
                                  onChanged: (double value) {
                                    setState(() {
                                      symptomlevel3 = value.toDouble();
                                      symptom = 'Diarrhea';
                                    });
                                  },
                                ),
                              )),
                          // Padding(
                          //   padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          //   child: RatingBar.builder(
                          //     initialRating: 0,
                          //     unratedColor: Color(0xffece5e5),
                          //     itemBuilder: (context, index) =>
                          //         Icon(Icons.star, color: Color(0xffffc107)),
                          //     itemCount: 5,
                          //     itemSize: 30,
                          //     direction: Axis.horizontal,
                          //     allowHalfRating: false,
                          //     onRatingUpdate: (value) {
                          //       if (value > 0) {
                          //         symptomlevel = value;
                          //         symptom = "Diarrhea";
                          //       }
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: Text(
                              "Nausea",
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
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: SliderTheme(
                                data: SliderThemeData(
                                  thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 12,
                                    disabledThumbRadius: 12,
                                    elevation: 4,
                                    pressedElevation: 6,
                                  ),
                                  activeTrackColor: Color(0xFF5CB85C),
                                  inactiveTrackColor: Colors.grey,
                                  overlayColor:
                                      Color(0xFF5CB85C).withOpacity(0.2),
                                  thumbColor: Color(0xFF5CB85C),
                                  valueIndicatorColor: Color(0xFF5CB85C),
                                  valueIndicatorTextStyle: TextStyle(
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
                                  label: 'Nausea: $symptomlevel4',
                                  onChanged: (double value) {
                                    setState(() {
                                      symptomlevel4 = value.toDouble();
                                      symptom = 'Nausea';
                                    });
                                  },
                                ),
                              )),
                          // Padding(
                          //   padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          //   child: RatingBar.builder(
                          //     initialRating: 0,
                          //     unratedColor: Color(0xffece5e5),
                          //     itemBuilder: (context, index) =>
                          //         Icon(Icons.star, color: Color(0xffffc107)),
                          //     itemCount: 5,
                          //     itemSize: 30,
                          //     direction: Axis.horizontal,
                          //     allowHalfRating: false,
                          //     onRatingUpdate: (value) {
                          //       if (value > 0) {
                          //         symptomlevel = value;
                          //         symptom = "Nausea";
                          //       }
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: Text(
                              "Gas",
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
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: SliderTheme(
                                data: SliderThemeData(
                                  thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 12,
                                    disabledThumbRadius: 12,
                                    elevation: 4,
                                    pressedElevation: 6,
                                  ),
                                  activeTrackColor: Color(0xFF5CB85C),
                                  inactiveTrackColor: Colors.grey,
                                  overlayColor:
                                      Color(0xFF5CB85C).withOpacity(0.2),
                                  thumbColor: Color(0xFF5CB85C),
                                  valueIndicatorColor: Color(0xFF5CB85C),
                                  valueIndicatorTextStyle: TextStyle(
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
                                  label: 'Gas: $symptomlevel5',
                                  onChanged: (double value) {
                                    setState(() {
                                      symptomlevel5 = value.toDouble();
                                      symptom = 'Gas';
                                    });
                                  },
                                ),
                              )),
                          // Padding(
                          //   padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          //   child: RatingBar.builder(
                          //     initialRating: 0,
                          //     unratedColor: Color(0xffece5e5),
                          //     itemBuilder: (context, index) =>
                          //         Icon(Icons.star, color: Color(0xffffc107)),
                          //     itemCount: 5,
                          //     itemSize: 30,
                          //     direction: Axis.horizontal,
                          //     allowHalfRating: false,
                          //     onRatingUpdate: (value) {
                          //       if (value > 0) {
                          //         symptomlevel = value;
                          //         symptom = "Gas";
                          //       }
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    
                  
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Visibility(
                        visible: textResult.isNotEmpty,
                        child: DottedBorder(
                          dashPattern: [6, 3, 2, 3],
                          color: ((symptomlevel1 == 1 ||
                                  symptomlevel2 == 1 ||
                                  symptomlevel3 == 1 ||
                                  symptomlevel4 == 1 ||
                                  symptomlevel5 == 1)
                              ? Colors.lightGreenAccent
                              : (symptomlevel1 == 2 ||
                                      symptomlevel2 == 2 ||
                                      symptomlevel3 == 2 ||
                                      symptomlevel4 == 2 ||
                                      symptomlevel5 == 2)
                                  ? Colors.yellow
                                  : (symptomlevel1 == 3 ||
                                          symptomlevel2 == 3 ||
                                          symptomlevel3 == 3 ||
                                          symptomlevel4 == 3 ||
                                          symptomlevel5 == 3)
                                      ? Colors.amber
                                      : (symptomlevel1 == 4 ||
                                              symptomlevel2 == 4 ||
                                              symptomlevel3 == 4 ||
                                              symptomlevel4 == 4 ||
                                              symptomlevel5 == 4)
                                          ? Colors.orange
                                          : (symptomlevel1 == 5 ||
                                                  symptomlevel2 == 5 ||
                                                  symptomlevel3 == 5 ||
                                                  symptomlevel4 == 5 ||
                                                  symptomlevel5 == 5)
                                              ? Colors.red
                                              : Colors.black),
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          child: Padding(
                              padding: EdgeInsets.symmetric(
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
                      padding: EdgeInsets.fromLTRB(80, 20, 88, 0),
                      child: MaterialButton(
                        onPressed: () async {
                          if (symptomlevel1 > 0 ||
                              symptomlevel2 > 0 ||
                              symptomlevel3 > 0 ||
                              symptomlevel4 > 0 ||
                              symptomlevel5 > 0) {
                            double highestSymptomLevel = 0;
                            if (symptomlevel1 > 0) {
                              highestSymptomLevel = symptomlevel1;
                            }
                            if (symptomlevel2 > 0 &&
                                symptomlevel2 > highestSymptomLevel) {
                              highestSymptomLevel = symptomlevel2;
                            }
                            if (symptomlevel3 > 0 &&
                                symptomlevel3 > highestSymptomLevel) {
                              highestSymptomLevel = symptomlevel3;
                            }
                            if (symptomlevel4 > 0 &&
                                symptomlevel4 > highestSymptomLevel) {
                              highestSymptomLevel = symptomlevel4;
                            }
                            if (symptomlevel5 > 0 &&
                                symptomlevel5 > highestSymptomLevel) {
                              highestSymptomLevel = symptomlevel5;
                            }
                            // Create a new document in the 'DoctorTreatements' collection with the current user's UID as the document ID

                            CollectionReference userHeadSymptomsRef = _symptoms
                                .doc(uid)
                                .collection("userAbdomenSymptoms");
                            await userHeadSymptomsRef.add({
                              "symptom": symptom,
                              "symptomlevel": highestSymptomLevel,
                              'timestamp': DateTime.now()
                            }).then((value) {
                              Get.snackbar(
                                  "Success", 'Data stored successfully',
                                  backgroundColor:
                                      Color.fromARGB(100, 22, 44, 33));
                            });
                          }
                          setState(() {
                            if (symptomlevel1 == 0 &&
                                symptomlevel2 == 0 &&
                                symptomlevel3 == 0 &&
                                symptomlevel4 == 0 &&
                                symptomlevel5 == 0) {
                              textResult = 'Rate your pain before submitting';
                              imageresult = "";
                            } else if (symptomlevel1 == 1 ||
                                symptomlevel2 == 1 ||
                                symptomlevel3 == 1 ||
                                symptomlevel4 == 1 ||
                                symptomlevel5 == 1) {
                              textResult =
                                  'You are in mild pain \n  Feel better soon!';
                              imageresult = "images/pain1.png";
                              colorClick = false;
                            } else if (symptomlevel1 == 2 ||
                                symptomlevel2 == 2 ||
                                symptomlevel3 == 2 ||
                                symptomlevel4 == 2 ||
                                symptomlevel5 == 2) {
                              textResult =
                                  ' You are in moderate pain \n Feel better soon!';
                              imageresult = "images/pain2.png";
                            } else if (symptomlevel1 == 3 ||
                                symptomlevel2 == 3 ||
                                symptomlevel3 == 3 ||
                                symptomlevel4 == 3 ||
                                symptomlevel5 == 3) {
                              textResult =
                                  ' you are severe pain \n Feel better soon!';
                              imageresult = "images/pain3.png";
                            } else if (symptomlevel1 == 4 ||
                                symptomlevel2 == 4 ||
                                symptomlevel3 == 4 ||
                                symptomlevel4 == 4 ||
                                symptomlevel5 == 4) {
                              textResult =
                                  'You are in very severe pain \n Feel better soon!';
                              imageresult = "images/pain4.png";
                            } else if (symptomlevel1 == 5 ||
                                symptomlevel2 == 5 ||
                                symptomlevel3 == 5 ||
                                symptomlevel4 == 5 ||
                                symptomlevel5 == 5) {
                              textResult =
                                  'You are in worst pain posible \n Feel better soon!';
                              imageresult = "images/pain5.png";
                            }
                          });
                        },
                        color: Color(0xFF5CB85C),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Color(0xff808080), width: 1),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        textColor: Color(0xff000000),
                        height: 40,
                        minWidth: 140,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
