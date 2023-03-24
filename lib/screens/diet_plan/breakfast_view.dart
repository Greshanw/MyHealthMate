import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import '../healthy-recipe/components/bottom_nav.dart';

class DietBreakfastView extends StatefulWidget {
  const DietBreakfastView({Key? key}) : super(key: key);

  @override
  State<DietBreakfastView> createState() => _DietBreakfastViewState();
}

class _DietBreakfastViewState extends State<DietBreakfastView> {
  final CollectionReference _dietBreakfast =
      FirebaseFirestore.instance.collection('dietbreakfast');

  // VIEW BREAKFAST
  @override
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
            "Diet Plan",
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
      // AppBar(
      //   leading: IconButton(
      //       icon: SvgPicture.asset('images/back.svg'),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       }
      //   ),
      //   elevation:4,
      //   centerTitle:false,
      //   automaticallyImplyLeading: false,
      //   backgroundColor:Color(0xFF5CB85C),
      //   shape:RoundedRectangleBorder(
      //     borderRadius:BorderRadius.zero,
      //   ),
      //   title:Text(
      //     "My Health Mate",
      //     style:TextStyle(
      //       fontWeight:FontWeight.w800,
      //       fontStyle:FontStyle.normal,
      //       fontSize:17,
      //       color:Color(0xffffffff),
      //     ),
      //   ),
      // ),
      //bottomNavigationBar: BottomNavBar(),
      body: StreamBuilder(
        stream: _dietBreakfast.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  shadowColor: Color(0xFF5CB85C),
                  margin: const EdgeInsets.all(13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.9),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        'Ingredients : ' + documentSnapshot['ingredients'],
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      'Description : ' + documentSnapshot['description'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
