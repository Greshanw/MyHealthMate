import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_health_mate/screens/symptoms_recorder/treatments_home_page.dart';

class SyptomSplash extends StatefulWidget  {
  const SyptomSplash({super.key});

  @override
  State<SyptomSplash> createState() => _SyptomSplashState();
}

class _SyptomSplashState extends State<SyptomSplash>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
              icon: SvgPicture.asset('images/back.svg'),
              onPressed: () {
                Navigator.pop(context);
              }
          ),
          elevation:4,
          centerTitle:false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.lightGreenAccent,
          shape:const RoundedRectangleBorder(
            borderRadius:BorderRadius.zero,
          ),
          title:const Text(
            "Health Mate",
            style:TextStyle(
              fontWeight:FontWeight.w800,
              fontStyle:FontStyle.normal,
              fontSize:17,
              color:Color(0xffffffff),
            ),
          ),
      ),
      body:  Center(
        child: Padding(
          padding:const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:const [
              Spacer(),
                  Text(
                    "Select Body Part",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  DoctorTreatments(),
                  Spacer(),
                  HeadSymptoms(),
                  BodySymptoms(),
                  AbdomenSymptoms(),
                  mentalsymptoms(),
                  skinsymptoms(),
                  OtherSymptoms(),
            ],
          ),
        ),
      ),
    );
  }
}

// HeadSymptoms
class HeadSymptoms extends StatelessWidget {
  const HeadSymptoms({super.key});

  void _navigateToHeadSymptoms(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HeadSymptomsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Color(0xffc396e5)
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
          splashColor: Colors.purpleAccent.withAlpha(30),
            onTap: () {
              _navigateToHeadSymptoms(context);
            },
        child:  SizedBox(
          width: 300,
          height: 60,
          child: Row(
            children: [
              Image(
                  image: AssetImage('images/head.png'),
                width: 70,
                height: 70),

              Text("Head",
                style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),),

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
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => BodySymptomsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Color(0xffc396e5)
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
    clipBehavior: Clip.hardEdge,
    child: InkWell(
    splashColor: Colors.blue.withAlpha(30),
    onTap: () {

      _navigateToBodySymptoms(context);
    },
        child: SizedBox(
          width: 300,
          height: 60,
          child: Row(
            children: [
              Image(
                  image: AssetImage('images/body.png'),
                  width: 70,
                  height: 70),

              Text("Body",
                style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),),
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
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AbdomenSymptomsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color:Color(0xffc396e5)
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
          clipBehavior: Clip.hardEdge,
           child: InkWell(
             splashColor: Colors.purpleAccent.withAlpha(30),
              onTap: () {
                _navigateToAbdomenSymptoms(context);
                  },

                 child:  SizedBox(
                   width: 300,
                   height: 60,
                   child: Row(

                      children: [
                        Image(
                           image: AssetImage('images/stomach.png'),
                           width: 70,
                           height: 70),
                           Text("Abdomen",
                             style: TextStyle(
                               fontWeight: FontWeight.w400,
                               fontStyle: FontStyle.normal,
                               fontSize: 20,
                               color: Colors.black,
                             ),),

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
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MentalSymptomsPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Color(0xffc396e5)
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
    clipBehavior: Clip.hardEdge,
    child: InkWell(
    splashColor: Colors.purpleAccent.withAlpha(30),
    onTap: () {
      _navigateToMentalSymptoms(context);
    },
        child:  SizedBox(
          width: 300,
          height: 60,
          child: Row(
            children: [
          Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child:
              Image(
                  image: AssetImage('images/mental.png'),
                  width: 40,
                  height: 40),
          ),
      Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 20, 0),
        child:
              Text("Mental",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: Colors.black,
                ),),)
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
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SkinSymptomsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color:Color(0xffc396e5)
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
         clipBehavior: Clip.hardEdge,
             child: InkWell(
             splashColor: Colors.purpleAccent.withAlpha(30),
             onTap: () {
               _navigateToSkinSymptoms(context);
               },
        child:  SizedBox(
          width: 300,
          height: 60,
          child: Row(
            children: [
              Image(
                  image: AssetImage('images/skin.png'),
                  width: 70,
                  height: 70),
              Text("Skin",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: Colors.black,
                ),)

            ],
          ),
        ),
      ),
    ),
    );
  }
}
// OtherSymptoms
class OtherSymptoms extends StatelessWidget {
  const OtherSymptoms({super.key});

  void _navigateToHeadSymptoms(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => OtherSymptomsPage()));
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Color(0xffc396e5)
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.purpleAccent.withAlpha(30),
          onTap: () {
            _navigateToHeadSymptoms(context);
          },
          child:  SizedBox(
            width: 300,
            height: 60,
            child: Row(
              children: [ Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child:
                Image(
                    image: AssetImage('images/otherSymptoms.jpg'),
                    width: 40,
                    height: 40),),
            Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
            child:
            Text("Other",

              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),),

            ),


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
     Navigator.of(context).push(MaterialPageRoute(builder: (context) => MedicalNote()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
          color: Color(0xffc396e5),

        shape: RoundedRectangleBorder(
          side: BorderSide(
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        clipBehavior: Clip.hardEdge,
             child: InkWell(
             splashColor: Colors.purpleAccent.withAlpha(30),
             onTap: () {
                _navigateToDoctorTreatementHome(context);
               },
            child:  SizedBox(
             width: 300,
             height: 160,
              child: Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding( padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child:  Column(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Text(
                            "Doctor",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Color(0xffffffff),
                            ),
                          ),

                          Text(
                            "Treatements",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Color(0xffffffff),
                            ),
                          ),
                          Text(
                            "Records",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Color(0xffffffff),
                            ),
                          ),

                        ],
                      ),),


                        Image(

                            image: AssetImage('images/doctor.png'),
                            width: 160,
                            height: 180
                            ),



                  ],
                ),
              ),

            )
        ),
      ),
    );
  }
}
