import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class SymptomsHeadHistory extends StatefulWidget {
  const SymptomsHeadHistory({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SymptomsHeadHistory> {
  late String uid;
  late final CollectionReference _symptoms;

  double ui = 0;
// text fields' controllers
  final TextEditingController _symptomsController = TextEditingController();
  final TextEditingController _symptomsDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Get the current user's UID
    uid = FirebaseAuth.instance.currentUser!.uid;

    _symptoms = FirebaseFirestore.instance
        .collection('symptoms')
        .doc(uid)
        .collection('userHeadSymptoms');
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _symptomsController.text = documentSnapshot['symptom'];
      _symptomsDateController.text = documentSnapshot['timestamp'].toString();
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
                Text(
                  "Update Symptom",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                TextField(
                  controller: _symptomsController,
                  decoration: const InputDecoration(labelText: 'symptom'),
                ),

                const SizedBox(
                  height: 20,
                ),
                RatingBar.builder(
                  initialRating: (0),
                  unratedColor: Color(0xffece5e5),
                  itemBuilder: (context, index) =>
                      Icon(Icons.star, color: Color(0xffffc107)),
                  itemCount: 5,
                  itemSize: 40,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  onRatingUpdate: (value) {
                    ui = value;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    child: const Text('Update'),
                    onPressed: () async {
                      final String symptom = _symptomsController.text;
                      final String date = _symptomsDateController.text;
                      final double? symptomlevel = ui;
                      if (symptomlevel != null) {
                        await _symptoms.doc(documentSnapshot!.id).update({
                          "symptom": symptom,
                          "symptomlevel": symptomlevel,
                          "timestamp": date
                        });
                        _symptomsController.text = '';
                        _symptomsDateController.text = '';
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Symptom updated',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Color(0xFF5CB85C),
                          ),
                        );
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF5CB85C), textStyle: TextStyle()))
              ],
            ),
          );
        });
  }

  Future<void> _delete(String productId) async {
    await _symptoms.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'You have successfully deleted a symptom',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Roboto',
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color(0xFF5CB85C),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: StreamBuilder(
          stream: _symptoms.snapshots(),
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
                      side: BorderSide(color: Color(0xFF5CB85C)),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: ListTile(
                      title: Column(children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                            child: Text(
                              documentSnapshot['symptom'],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            )),
                      ]),
                      subtitle: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _getColorFromSymptomLevel(
                              documentSnapshot['symptomlevel']),
                        ),
                        child: Center(
                          child: Text(
                            _getTextFromSymptomLevel(
                                documentSnapshot['symptomlevel']),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      isThreeLine: true,
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.amber,
                                  size: 30,
                                ),
                                onPressed: () => _update(documentSnapshot)),
                            // IconButton(
                            //     icon: const Icon(Icons.delete),
                            //     onPressed: () =>
                            //         _delete(documentSnapshot.id)),
                            IconButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xEFEFEFFF),
                                shape: CircleBorder(),
                              ),
                              icon: Icon(Icons.delete,
                                  color: Colors.red, size: 30),
                              onPressed: () {
                                // Delete Confirmation Message
                                // set up the buttons
                                Widget cancelButton = TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                );
                                Widget continueButton = TextButton(
                                  child: Text("Ok"),
                                  onPressed: () => _delete(documentSnapshot.id)
                                      .then((value) => Navigator.pop(context)),
                                );

                                // set up the AlertDialog
                                AlertDialog alert = AlertDialog(
                                  title: Text("Health Manager"),
                                  content: Text("Are you sure want to delete?"),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}

Color _getColorFromSymptomLevel(double symptomLevel) {
  if (symptomLevel == 1) {
    return Colors.green;
  } else if (symptomLevel == 2) {
    return Colors.lightGreen;
  } else if (symptomLevel == 3) {
    return Colors.yellow;
  } else if (symptomLevel == 4) {
    return Colors.orange;
  } else if (symptomLevel == 5) {
    return Colors.red;
  } else {
    return Color(0xffece5e5);
  }
}

String _getTextFromSymptomLevel(double symptomLevel) {
  if (symptomLevel == 1) {
    return "Mild";
  } else if (symptomLevel == 2) {
    return "Moderate";
  } else if (symptomLevel == 3) {
    return "Moderate to Severe";
  } else if (symptomLevel == 4) {
    return "Severe";
  } else if (symptomLevel == 5) {
    return "Very Severe";
  } else {
    return "No rating";
  }
}
