import 'dart:ui';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_health_mate/screens/symptoms_recorder/abdomensymptoms.dart';
import 'package:my_health_mate/screens/symptoms_recorder/bodysymptoms.dart';
import 'package:my_health_mate/screens/symptoms_recorder/head_symptoms.dart';
import 'package:my_health_mate/screens/symptoms_recorder/mentalsymptoms.dart';
import 'package:my_health_mate/screens/symptoms_recorder/skinsymptoms.dart';
import 'package:my_health_mate/screens/symptoms_recorder/treatments_home_page.dart';

class SyptomSplash extends StatefulWidget {
  const SyptomSplash({super.key});

  @override
  State<SyptomSplash> createState() => _SyptomSplashState();
}

class _SyptomSplashState extends State<SyptomSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Color(0xFF5CB85C),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: const Text(
          "Symptom Tracker",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.normal,
            fontSize: 18,
            color: Color(0xffffffff),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const DoctorTreatments(),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Select Body Part",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Color(0xFF333333),
                      letterSpacing: 1.2,
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  const HeadSymptoms(),
                  const SizedBox(
                    height: 30,
                  ),
                  const BodySymptoms(),
                  const SizedBox(
                    height: 30,
                  ),
                  const AbdomenSymptoms(),
                  const SizedBox(
                    height: 30,
                  ),
                  const mentalsymptoms(),
                  const SizedBox(
                    height: 30,
                  ),
                  const skinsymptoms(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// HeadSymptoms
class HeadSymptoms extends StatelessWidget {
  const HeadSymptoms({super.key});

  void _navigateToHeadSymptoms(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HeadSymptomsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xFF5CB85C),
          ),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            _navigateToHeadSymptoms(context);
          },
          child: SizedBox(
            width: 300,
            height: 60,
            child: Row(
              children: const [
                SizedBox(
                  width: 5,
                ),
                Image(
                    image: AssetImage('images/head.png'),
                    width: 50,
                    height: 50),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Head",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// BodySymptoms
class BodySymptoms extends StatelessWidget {
  const BodySymptoms({super.key});
  void _navigateToBodySymptoms(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BodySymptomsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xFF5CB85C),
          ),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            _navigateToBodySymptoms(context);
          },
          child: SizedBox(
            width: 300,
            height: 60,
            child: Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Image(
                    image: AssetImage('images/body.png'),
                    width: 45,
                    height: 45),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "Body",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// AbdomenSymptoms
class AbdomenSymptoms extends StatelessWidget {
  const AbdomenSymptoms({super.key});
  void _navigateToAbdomenSymptoms(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AbdomenSymptomsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xFF5CB85C),
          ),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            _navigateToAbdomenSymptoms(context);
          },
          child: SizedBox(
            width: 300,
            height: 60,
            child: Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Image(
                    image: AssetImage('images/stomach.png'),
                    width: 40,
                    height: 40),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "Abdomen",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// mentalsymptoms
class mentalsymptoms extends StatelessWidget {
  const mentalsymptoms({super.key});
  void _navigateToMentalSymptoms(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MentalSymptomsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xFF5CB85C),
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            _navigateToMentalSymptoms(context);
          },
          child: SizedBox(
            width: 300,
            height: 60,
            child: Row(
              children:const [
                SizedBox(
                  width: 5,
                ),
                Image(
                    image: AssetImage('images/mental.png'),
                    width: 50,
                    height: 50),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Mental",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// skinsymptoms
class skinsymptoms extends StatelessWidget {
  const skinsymptoms({super.key});

  void _navigateToSkinSymptoms(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SkinSymptomsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape:  const RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xFF5CB85C),
          ),
          borderRadius:  BorderRadius.all(Radius.circular(12)),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            _navigateToSkinSymptoms(context);
          },
          child: SizedBox(
            width: 300,
            height: 60,
            child: Row(
              children: const [
                SizedBox(
                  width: 15,
                ),
                Image(
                    image: AssetImage('images/skin.png'),
                    width: 40,
                    height: 40),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Skin",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// DoctorTreatments
class DoctorTreatments extends StatelessWidget {
  const DoctorTreatments({super.key});
  void _navigateToDoctorTreatementHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MedicalNote()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: ElevatedButton(
        onPressed: () {
          _navigateToDoctorTreatementHome(context);
        },
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF5CB85C),
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              'images/doctor.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 16),
            const Text(
              'Doctor Treatment Records',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
