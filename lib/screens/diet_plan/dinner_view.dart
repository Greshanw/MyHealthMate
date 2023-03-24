import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dinner.dart';
//import '../healthy-recipe/components/bottom_nav.dart';

class DietDinnerView extends StatefulWidget {
  const DietDinnerView({Key? key}) : super(key: key);

  @override
  State<DietDinnerView> createState() => _DietDinnerViewState();
}

class _DietDinnerViewState extends State<DietDinnerView> {

  final CollectionReference _dietDinner =
  FirebaseFirestore.instance.collection('dietdinner');

  // VIEW DINNER
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        leading: IconButton(
            icon: SvgPicture.asset('images/back.svg'),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        elevation:4,
        centerTitle:false,
        automaticallyImplyLeading: false,
        backgroundColor:Color(0xFF5CB85C),
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.zero,
        ),
        title:Text(
          "My Health Mate",
          style:TextStyle(
            fontWeight:FontWeight.w800,
            fontStyle:FontStyle.normal,
            fontSize:17,
            color:Color(0xffffffff),
          ),
        ),
      ),
      //bottomNavigationBar: BottomNavBar(),
        body: StreamBuilder(
          stream: _dietDinner.snapshots(),
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
                        'Ingredients : '+ documentSnapshot['ingredients'],
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                      ),

                      subtitle: Text(
                        'Description : '+ documentSnapshot['description'],
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