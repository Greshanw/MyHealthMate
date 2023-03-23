import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_health_mate/screens/body_weight_tracker/body_weight_chart.dart';

class BodyWeightTracker extends StatefulWidget {
  const BodyWeightTracker({super.key});

  @override
  State<BodyWeightTracker> createState() => _BodyWeightTrackerState();
}

class _BodyWeightTrackerState extends State<BodyWeightTracker> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('weights');

  User? user = FirebaseAuth.instance.currentUser;

  // ADD WEIGHT FUNCTION
  Future<void> _create() async {
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
                TextField(
                  controller: _weightController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.man), labelText: 'Weight (Kg)'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: 'Date',
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);

                      setState(() {
                        _dateController.text = formattedDate;
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 160),
                    backgroundColor: const Color(0xFF5CB85C),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    final double? weight =
                        double.tryParse(_weightController.text);
                    final String dates = _dateController.text;
                    if (_weightController.value.text.isNotEmpty &&
                        _dateController.value.text.isNotEmpty) {
                      await collection
                          .doc(user!.uid)
                          .collection('userWeights')
                          .add({"weight": weight, "date": dates}).then((value) {
                        const snackBar = SnackBar(
                          content: Text('Weight added successfully!'),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                      _weightController.text = '';
                      _dateController.text = '';
                      if (mounted) {
                        Navigator.of(context).pop();
                      }
                    } else {
                      if (_weightController.value.text.isEmpty) {
                        Get.snackbar('Failed', 'Weight Cannot Be Empty');
                      } else {
                        Get.snackbar('Failed', 'Date Cannot Be Empty');
                      }
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // UPDATE WEIGHT FUNCTION
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _weightController.text = documentSnapshot['weight'].toString();
      _dateController.text = documentSnapshot['date'];
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
                TextField(
                  controller: _weightController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.man), labelText: 'Weight'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: 'Date',
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);

                      setState(() {
                        _dateController.text = formattedDate;
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 150),
                      backgroundColor: Colors.orange),
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    final double? weight =
                        double.tryParse(_weightController.text);
                    final String dates = _dateController.text;
                    if (weight != null) {
                      await collection
                          .doc(user!.uid)
                          .collection('userWeights')
                          .doc(documentSnapshot!.id)
                          .update({"weight": weight, "date": dates}).then(
                              (value) {
                        const snackBar = SnackBar(
                          content: Text('Weight updated successfully!'),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                      _weightController.text = '';
                      _dateController.text = '';
                      if (mounted) {
                        Navigator.of(context).pop();
                      }
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // DELETE WEIGHT FUNCTION
  Future<void> _delete(String recordId) async {
    await collection
        .doc(user!.uid)
        .collection('userWeights')
        .doc(recordId)
        .delete()
        .then((value) {
      const snackBar = SnackBar(
        content: Text('Weight deleted successfully!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
    if (mounted) {
      Navigator.pop(context);
    }
  }

  // VIEW BODY WEIGHTS
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
            "Body Weight Tracker",
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
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: collection
                  .doc(user!.uid)
                  .collection('userWeights')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          title: Text(
                            '${documentSnapshot['weight']} kg',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            documentSnapshot['date'],
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          trailing: SizedBox(
                            width: 130,
                            child: Row(
                              children: [
                                TextButton(
                                  child: const Icon(
                                    Icons.edit,
                                    color: Color(0xFFFFA000),
                                  ),
                                  onPressed: () => _update(documentSnapshot),
                                ),
                                TextButton(
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    // show the dialog
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Health Manager"),
                                          content: const Text(
                                              "Are you sure want to delete?"),
                                          actions: [
                                            TextButton(
                                              child: const Text("Cancel"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            TextButton(
                                              child: const Text("Ok"),
                                              onPressed: () =>
                                                  _delete(documentSnapshot.id),
                                            ),
                                          ],
                                        );
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
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _create();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5CB85C),
                  ),
                  label: const Text("ADD"),
                  icon: const Icon(Icons.add),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _navigateToAnalytics(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5CB85C),
                  ),
                  label: const Text("Analytics"),
                  icon: const Icon(Icons.bar_chart),
                ),
              ),
              const SizedBox(width: 20),
            ],
          )
        ],
      ),
    );
  }

  void _navigateToAnalytics(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const BodyWeightChart()));
  }
}
