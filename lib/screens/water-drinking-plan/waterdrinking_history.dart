
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';



class WaterDrinkingHistory extends StatefulWidget {
  const WaterDrinkingHistory({Key? key}) : super(key: key);


  @override
  _WaterHistoryPageState createState() => _WaterHistoryPageState();
}

class _WaterHistoryPageState extends State<WaterDrinkingHistory> {

  double ui=0;
// text fields' controllers
  final TextEditingController _waterGoalController = TextEditingController();
  final TextEditingController _drinkinglevelDateController = TextEditingController();



  final CollectionReference _waterintake =
  FirebaseFirestore.instance.collection('DailyWaterIntake');


  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {

      _waterGoalController.text = documentSnapshot['Goal'].toString();
      _drinkinglevelDateController.text  =  documentSnapshot['waterintake'].toString();


    }

    await showModalBottomSheet(

        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {

          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(_symptomsDateController.text.toString()),
                Text("Edit Record",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),),
                const SizedBox(
                  height: 40,
                ),

                TextField(
                  controller:_waterGoalController ,
                  decoration: const InputDecoration(labelText: 'WaterGoal'),
                ),


                const SizedBox(
                  height: 20,
                ),
              TextField(
              controller:_drinkinglevelDateController ,
              decoration: const InputDecoration(labelText: 'waterintake'),

          ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(

                    child: const Text( 'Update'),

                    onPressed: () async {
                      final double? Goal = double.tryParse(_waterGoalController.text);
                      final double? waterintake =double.tryParse(_drinkinglevelDateController.text);



                        await _waterintake
                            .doc(documentSnapshot!.id)
                            .update({"Goal": Goal, "waterintake": waterintake});
                      _waterGoalController.text = '';
                      _waterGoalController.text = '';
                        Navigator.of(context).pop();

                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF5CB85C),
                        textStyle: TextStyle(
                        ))
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String productId) async {
    await _waterintake.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully delete the data')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          title: Text("My Health Mate"),
          backgroundColor:Color(0xFF5CB85C),
        ),

        body:

        StreamBuilder(

          stream: _waterintake.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                  streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Color(0xFF5CB85C)
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    clipBehavior: Clip.hardEdge,

                    child: ListTile(
                      title: Column(

                          children:[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child:   Text(DateFormat('yyyy-MM-dd').format((documentSnapshot['timestamp']).toDate()).toString()),

                            ),

                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                                child:Text("Water Goal   :" + documentSnapshot['Goal'].toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18
                                  ),
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                                child:Text("Water Intake   :" + documentSnapshot['waterintake'].toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18
                                  ),
                                )
                            ),


                          ]),

                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.edit,
                                  color: Colors.amber,
                                  size: 30,),
                                onPressed: () =>
                                    _update(documentSnapshot)),

                            IconButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xEFEFEFFF),
                                shape: CircleBorder(),
                              ),
                              icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 30
                              ),
                              onPressed: () {
                                // Delete Confirmation Message
                                // set up the buttons
                                Widget cancelButton = TextButton(
                                  child: Text("Cancel"),
                                  onPressed:  () {
                                    Navigator.pop(context);
                                  },
                                );
                                Widget continueButton = TextButton(
                                  child: Text("Ok"),
                                  onPressed: () =>  _delete(documentSnapshot.id).then((value) =>  Navigator.pop(context)),

                                );

                                // set up the AlertDialog
                                AlertDialog alert = AlertDialog(
                                  title: Text("My Health Mate"),
                                  content: Text("Do you want to delete this?"),
                                  actions: [
                                    cancelButton,
                                    continueButton,
                                  ],
                                );
                                // show the dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );
                              },
                            ),

                          ],
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

// Add new product

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}
