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

  const AbdomenSymptomsPage ({Key? key}):super(key: key);

  @override
  _AbdomenSymptomsState createState()=>_AbdomenSymptomsState();


}
class _AbdomenSymptomsState extends State<AbdomenSymptomsPage>{


  // Get the current user's UID
  String uid = FirebaseAuth.instance.currentUser!.uid;


  final CollectionReference _symptoms =
  FirebaseFirestore.instance.collection('symptoms');

  void _navigateToSymptomHistory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SymptomsAbdomenHistory()));
  }

  double symptomlevel=0;
  String symptom="";

  String textResult='';
  String imageresult="";


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.6,0.7,0.8,0.88,0.95,0.98],
        colors: (symptomlevel == 1)?
    [
      Colors.white,
      Colors.lightGreen.shade50,
      Colors.lightGreen.shade100,
      Colors.lightGreen.shade200,
      Colors.lightGreen.shade300,
      Colors.lightGreenAccent.shade400,

    ]:
    (symptomlevel == 2)?
    [
      Colors.white,
      Colors.yellow.shade50,
      Colors.yellow.shade100,
      Colors.yellow.shade200,
      Colors.yellow.shade300,
      Colors.yellow.shade400,

    ]:
    (symptomlevel == 3)?
    [
      Colors.white,
      Colors.amber.shade50,
      Colors.amber.shade100,
      Colors.amber.shade200,
      Colors.amber.shade300,
      Colors.amber.shade500,

    ]:
    (symptomlevel == 4)?
    [
      Colors.white,
      Colors.orange.shade50,
      Colors.orange.shade100,
      Colors.orange.shade200,
      Colors.orange.shade300,
      Colors.orange.shade800,

    ]:
    (symptomlevel == 5)?
    [
      Colors.white,
      Colors.red.shade50,
      Colors.red.shade100,
      Colors.red.shade200,
      Colors.red.shade300,
      Colors.red.shade400,

    ]:
    [
      Colors.white,
      Colors.grey.shade50,
      Colors.grey.shade100,
      Colors.grey.shade200,
      Colors.grey.shade300,
      Colors.grey.shade400,


    ]
    )
    ),
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar:
      AppBar(
            leading: IconButton(
                icon: SvgPicture.asset('images/back.svg'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            elevation: 4,
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.lightGreenAccent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            title: const Text(
              "Health Mate",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
                fontSize: 17,
                color: Color(0xffffffff),
              ),
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
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child:  MaterialButton(
                          onPressed: () async {


                          },
                          color: Color(0xffc396e5),
                          elevation: 0,

                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
                        child:  MaterialButton(
                          onPressed: () async {
                            _navigateToSymptomHistory(context);

                          },
                          color: Color(0xffb4b0b7),
                          elevation: 0,

                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
                        padding: EdgeInsets.fromLTRB(30, 0, 80, 10),
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
                        child: RatingBar.builder(
                          initialRating: 0,
                          unratedColor: Color(0xffece5e5),
                          itemBuilder: (context, index) =>
                              Icon(Icons.star, color: Color(0xffffc107)),
                          itemCount: 5,
                          itemSize: 30,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          onRatingUpdate: (value) {
                            if(value>0){
                              symptomlevel=value;
                              symptom="Bloating";

                            }


                          },
                        ),
                      ),
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
                        padding: EdgeInsets.fromLTRB(30, 0, 40, 0),
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
                        padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: RatingBar.builder(
                          initialRating: 0,
                          unratedColor: Color(0xffece5e5),
                          itemBuilder: (context, index) =>
                              Icon(Icons.star, color: Color(0xffffc107)),
                          itemCount: 5,
                          itemSize: 30,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          onRatingUpdate: (value) {
                            if(value>0){
                              symptomlevel=value;
                              symptom="Constipation";

                            }
                          },
                        ),
                      ),
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
                        padding: EdgeInsets.fromLTRB(30, 0, 70, 0),
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
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: RatingBar.builder(
                          initialRating: 0,
                          unratedColor: Color(0xffece5e5),
                          itemBuilder: (context, index) =>
                              Icon(Icons.star, color: Color(0xffffc107)),
                          itemCount: 5,
                          itemSize: 30,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          onRatingUpdate: (value) {
                            if(value>0){
                              symptomlevel=value;
                              symptom="Diarrhea";

                            }
                          },
                        ),
                      ),
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
                        padding: EdgeInsets.fromLTRB(30, 0, 80, 0),
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
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: RatingBar.builder(
                          initialRating: 0,
                          unratedColor: Color(0xffece5e5),
                          itemBuilder: (context, index) =>
                              Icon(Icons.star, color: Color(0xffffc107)),
                          itemCount: 5,
                          itemSize: 30,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          onRatingUpdate: (value) {
                            if(value>0){
                              symptomlevel=value;
                              symptom="Nausea";

                            }
                          },
                        ),
                      ),
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
                        padding: EdgeInsets.fromLTRB(30, 0, 110, 0),
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
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: RatingBar.builder(
                          initialRating: 0,
                          unratedColor: Color(0xffece5e5),
                          itemBuilder: (context, index) =>
                              Icon(Icons.star, color: Color(0xffffc107)),
                          itemCount: 5,
                          itemSize: 30,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          onRatingUpdate: (value) {
                            if(value>0){
                              symptomlevel=value;
                              symptom="Gas";

                            }
                          },
                        ),
                      ),
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
                        padding: EdgeInsets.fromLTRB(30, 0, 80, 0),
                        child: Text(
                          "Hunger",
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
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: RatingBar.builder(
                          initialRating: 0,
                          unratedColor: Color(0xffece5e5),
                          itemBuilder: (context, index) =>
                              Icon(Icons.star, color: Color(0xffffc107)),
                          itemCount: 5,
                          itemSize: 30,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          onRatingUpdate: (value) {
                            if(value>0){
                              symptomlevel=value;
                              symptom="Hunger";

                            }
                          },
                        ),
                      ),
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
                        padding: EdgeInsets.fromLTRB(30, 0, 60, 0),
                        child: Text(
                          "Dyspepsia",
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
                      RatingBar.builder(
                        initialRating: 0,
                        unratedColor: Color(0xffece5e5),
                        itemBuilder: (context, index) =>
                            Icon(Icons.star, color: Color(0xffffc107)),
                        itemCount: 5,
                        itemSize: 30,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        onRatingUpdate: (value) {
                          if(value>0){
                            symptomlevel=value;
                            symptom="Dyspepsia";

                          }
                        },
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20,),
                  child: Visibility(
                    visible: textResult.isNotEmpty,
                    child: DottedBorder(
                      dashPattern: [6, 3, 2, 3],
                      color:( (symptomlevel==1)? Colors.lightGreenAccent:
                      (symptomlevel==2)?Colors.yellow:
                      (symptomlevel==3) ?Colors.amber:
                      (symptomlevel==4)?Colors.orange:
                      (symptomlevel==5) ?Colors.red :
                      Colors.black),
                      borderType: BorderType.RRect,
                      radius: Radius.circular(12),

                      child:Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Row(
                              children: [
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
                                    child:Image(
                                      image: AssetImage(imageresult),
                                      height: 40.0,
                                      width: 40.0,
                                    ))
                              ]
                          )),

                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(80, 20, 88, 0),
                  child: MaterialButton(
                    onPressed: () async {
                      if (symptomlevel >0) {
                        CollectionReference userHeadSymptomsRef = _symptoms
                                .doc(uid)
                                .collection("userAbdomenSymptoms");
                            await userHeadSymptomsRef.add({
                              "symptom": symptom,
                              "symptomlevel": symptomlevel,
                              'timestamp': DateTime.now()
                            }).then((value){
                          Get.snackbar("Success", 'Data stored successfully', backgroundColor: Color.fromARGB(100, 22, 44, 33));
                        });


                      }
                      setState(() {
                            if (symptomlevel == 0) {
                              textResult = 'Rate your pain before submitting';
                              imageresult = "";
                            } else if (symptomlevel == 1) {
                              textResult =
                                  'You are in mild pain \n  Feel better soon!';
                              imageresult = "images/pain1.png";
                            } else if (symptomlevel == 2) {
                              textResult =
                                  ' You are in moderate pain \n Feel better soon!';
                              imageresult = "images/pain2.png";
                            } else if (symptomlevel == 3) {
                              textResult =
                                  ' you are severe pain \n Feel better soon!';
                              imageresult = "images/pain3.png";
                            } else if (symptomlevel == 4) {
                              textResult =
                                  'You are in very severe pain \n Feel better soon!';
                              imageresult = "images/pain4.png";
                            } else if (symptomlevel == 5) {
                              textResult =
                                  'You are in worst pain posible \n Feel better soon!';
                              imageresult = "images/pain5.png";
                            }
                          });

                    },
                    color: Color(0xffc396e5),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Color(0xff808080), width: 1),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
    )
    );
  }
}