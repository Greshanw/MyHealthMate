import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class UserTreatmentsPage extends StatefulWidget {
  const UserTreatmentsPage({Key? key}) : super(key: key);

  @override
  State<UserTreatmentsPage> createState() => _UserTreatmentsPageState();
}

class _UserTreatmentsPageState extends State<UserTreatmentsPage> {
  late String uid;
  late CollectionReference userTreatmentsRef;

  @override
  void initState() {
    super.initState();
    // Get the current user's UID
    uid = FirebaseAuth.instance.currentUser!.uid;

    // Create a reference to the current user's treatments collection
    userTreatmentsRef = FirebaseFirestore.instance
        .collection('DoctorTreatements')
        .doc(uid)
        .collection('userTreatments');
  }

  Future<void> _deleteTreatment(String id) async {
    try {
      await userTreatmentsRef.doc(id).delete();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Treatment deleted'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to delete treatment'),
      ));
    }
  }

  Future<void> _updateTreatment(
      String id, String doctorName, String note, String date) async {
    try {
      await userTreatmentsRef.doc(id).update({
        'doctor_name': doctorName,
        'note': note,
        'date': date,
      });
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Treatment updated'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to update treatment'),
      ));
    }
  }

  void _showUpdateModal(String id, String currentDoctorName, String currentNote,
      String currentDate, String imageFile) {
    final doctorNameController = TextEditingController(text: currentDoctorName);
    final noteController = TextEditingController(text: currentNote);
    final dateController = TextEditingController(text: currentDate);
    String _imageFile = imageFile;

    Future<void> _getImage(ImageSource source) async {
      final pickedFile = await ImagePicker().getImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _imageFile = pickedFile.path;
        });
      }
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Update Treatment',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(
          child: Container(
            height: 850,
            width: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SafeArea(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Icon(Icons.camera_alt),
                                title: Text('Take a photo'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _getImage(ImageSource.camera);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.photo_library),
                                title: Text('Choose from gallery'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _getImage(ImageSource.gallery);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _imageFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            _imageFile,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(
                          Icons.add_a_photo,
                          size: 50,
                          color: Colors.grey[400],
                        ),
                ),
              ),
                SizedBox(height: 10),
                TextField(
                  controller: doctorNameController,
                  decoration: InputDecoration(
                    hintText: 'Doctor Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: noteController,
                  decoration: InputDecoration(
                    hintText: 'Note',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: 'Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), //get today's date
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: Color(0xffc396e5), // <-- SEE HERE
                              onPrimary: Colors.black87, // <-- SEE HERE
                              onSurface: Colors.black87, // <-- SEE HERE
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                primary: Colors.black87, // button text color
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
        
                    if (pickedDate != null) {
                      print(
                          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(
                          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                      print(
                          formattedDate); //formatted date output using intl package =>  2022-07-04
                      //You can format date as per your need
        
                      setState(() {
                        dateController.text =
                            formattedDate; //set foratted date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final doctorName = doctorNameController.text.trim();
              final note = noteController.text.trim();
              final date = dateController.text.trim();
              if (doctorName.isNotEmpty && note.isNotEmpty && date.isNotEmpty) {
                _updateTreatment(id, doctorName, note, date);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please fill all fields'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Text(
              'Submit',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userTreatmentsRef = FirebaseFirestore.instance
        .collection('DoctorTreatements')
        .doc(currentUser!.uid)
        .collection('userTreatments');

    return Scaffold(
      appBar: AppBar(
        title: Text('User Treatments'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: userTreatmentsRef.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final treatments = snapshot.data!.docs;

          if (treatments.isEmpty) {
            return Center(child: Text('No treatments added yet.'));
          }

          return ListView.builder(
            itemCount: treatments.length,
            itemBuilder: (context, index) {
              final treatment = treatments[index];

              return ListTile(
                leading: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: Image.network(
                              treatment['image'],
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Image.network(
                    treatment['image'],
                    fit: BoxFit.cover,
                    width: 80.0,
                    height: 80.0,
                  ),
                ),
                title: Text(treatment['doctor_name']),
                subtitle: Text(treatment['note']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteTreatment(treatment.id);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _showUpdateModal(
                            treatment.id,
                            treatment['doctor_name'],
                            treatment['note'],
                            treatment['date'],
                            treatment['image']);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
