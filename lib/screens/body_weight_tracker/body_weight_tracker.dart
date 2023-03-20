import 'package:cloud_firestore/cloud_firestore.dart';
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
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Health Manager');
  // Text fields' controllers
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final CollectionReference _weight =
      FirebaseFirestore.instance.collection('weights');

  // ADD WEIGHT FUNCTION
  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
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
                      await _weight
                          .add({"weight": weight, "date": dates}).then((value) {
                        Get.snackbar('Success', 'Successfully Saved');
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
                      await _weight.doc(documentSnapshot!.id).update(
                          {"weight": weight, "date": dates}).then((value) {
                        Get.snackbar('Success', 'Successfully Updated');
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
    await _weight.doc(recordId).delete().then((value) {
      Get.snackbar('Success', 'Successfully Deleted');
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
        elevation: 4,
        centerTitle: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: customSearchBar,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _weight.snapshots(),
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
                                    Widget cancelButton = TextButton(
                                      child: const Text("Cancel"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    );
                                    Widget continueButton = TextButton(
                                      child: const Text("Ok"),
                                      onPressed: () =>
                                          _delete(documentSnapshot.id),
                                    );

                                    // set up the AlertDialog
                                    AlertDialog alert = AlertDialog(
                                      title: const Text("Health Manager"),
                                      content: const Text(
                                          "Are you sure want to delete?"),
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
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _create();
                  },
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
                  label: const Text("Analytics"),
                  icon: const Icon(Icons.bar_chart),
                ),
              ),
              const SizedBox(width: 20),
            ],
          )
        ],
      ),
      // Add Button
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterFloat,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: <Widget>[
      //       FloatingActionButton(
      //         onPressed: () => _create(),
      //         child: Icon(Icons.add),
      //       ),
      //       FloatingActionButton(
      //         onPressed: () {
      //           _navigateToAnalytics(context);
      //         },
      //         child: Icon(Icons.bar_chart),
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  void _navigateToAnalytics(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const BodyWeightChart()));
  }
}
