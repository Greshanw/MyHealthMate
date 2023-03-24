import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:my_health_mate/screens/symptoms_recorder/treatments_history_page.dart';

class MedicalNote extends StatefulWidget {
  const MedicalNote({super.key});

  @override
  State<MedicalNote> createState() => _MedicalNoteState();
}

class _MedicalNoteState extends State<MedicalNote> {
  void _navigateToTreatementsHistory(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const UserTreatmentsPage()));
  }

  File? myImage;

  TextEditingController drNameController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          leading: IconButton(
          icon: Container(
            height: 32,
            width: 32,
            child:const CircleAvatar(
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
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor:const Color(0xFF5CB85C),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          title: const Text(
            "Treatment Tracker ",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.normal,
              fontSize: 18,
              color: Color(0xffffffff),
            ),
          ),
          
          
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(width: 7),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: MaterialButton(
                          onPressed: () async {},
                          color: Color(0xFF5CB85C),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          textColor: Color(0xff000000),
                          height: 40,
                          minWidth: 190,
                          child:const Text(
                            "Treatements",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: MaterialButton(
                          onPressed: () async {
                            _navigateToTreatementsHistory(context);
                          },
                          color: const Color(0xffb4b0b7),
                          elevation: 0,
                          padding:const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          textColor: Color(0xff000000),
                          height: 40,
                          minWidth: 190,
                          child: const Text(
                            "History",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    "Insert Treatment Details",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: drNameController,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Color(0xFF5CB85C), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Color(0xFF5CB85C), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Color(0xFF5CB85C), width: 1),
                      ),
                      hintText: "Doctor Name",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Color(0xffb4b0b7),
                      ),
                      filled: true,
                      fillColor: const Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      controller: dateController,
                      obscureText: false,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Color(0xff000000),
                      ),
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide:
                              const BorderSide(color: Color(0xFF5CB85C), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide:
                              const BorderSide(color: Color(0xFF5CB85C), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide:
                              const BorderSide(color: Color(0xFF5CB85C), width: 1),
                        ),
                        hintText: "Date of Treatement",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          color: Color(0xffb4b0b7),
                        ),
                        filled: true,
                        fillColor: const Color(0xfff2f2f3),
                        isDense: false,
                        contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                                colorScheme:const  ColorScheme.light(
                                  primary: Color(0xFF5CB85C), 
                                  onPrimary: Colors.black87, 
                                  onSurface: Colors.black87, 
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    primary:
                                        Colors.black87, 
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
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: noteController,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Color(0xFF5CB85C), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Color(0xFF5CB85C), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Color(0xFF5CB85C), width: 1),
                      ),
                      hintText: "Note",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Color(0xffb4b0b7),
                      ),
                      filled: true,
                      fillColor: const Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      openBottomSheet();
                    },
                    child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        padding: const EdgeInsets.all(6),
                        child: Container(
                            height: 230,
                            width: 150,
                            color: const Color.fromARGB(255, 184, 221, 184),
                            child: myImage == null
                                ? const Center(
                                    child: Image(
                                          image: AssetImage('images/photo.png'),
                                          width: 40,
                                          height: 40),
                                  )
                                : Image.file(
                                    myImage!,
                                    fit: BoxFit.cover,
                                  )))),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 70,
                    ),
                    child: MaterialButton(
                        color: const Color(0xFF5CB85C),
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 50,
                        onPressed: () {
                          uplodaFile();
                        },
                        child: const Text("Insert Treatment Data", style: TextStyle(fontSize: 18),) ))
              ],
            ),
          ),
        )
        );
  }

  // This function opens a modal bottom sheet with two options:
  // take a photo or choose from gallery.
  openBottomSheet() {
    // showModalBottomSheet is a built-in function that creates a modal
    // bottom sheet and displays it on top of the current screen.
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Take a photo'),
                  onTap: () {
                    Navigator.pop(context);
                    getImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Choose from gallery'),
                  onTap: () {
                    Navigator.pop(context);
                    getImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }

  buildImageWidget({required IconData iconData, required Function onPressed}) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(
            iconData,
            size: 30,
          ),
        ),
      ),
    );
  }

  final ImagePicker _picker = ImagePicker();
  getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      myImage = File(image.path);
      // uplodaFile();
      setState(() {});
      Get.back();
    }
  }

  void uplodaFile() async {
    
    final file = myImage;
    final metaData = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref = storageRef
        .child('pictures/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = ref.putFile(file!, metaData);

    uploadTask.snapshotEvents.listen((event) {
      switch (event.state) {
        case TaskState.running:
          print("file is uplording");
          break;
        case TaskState.success:
          ref.getDownloadURL().then((value) => storeEntry(value,
              drNameController.text, noteController.text, dateController.text));
          break;
      }
    });
  }

  storeEntry(String imgUrl, String drname, String note, String date) {
    
    // Get the current user's UID
    String uid = FirebaseAuth.instance.currentUser!.uid;

    final CollectionReference _collection =
        FirebaseFirestore.instance.collection('DoctorTreatements');
        
    // Show the progress indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Create a new document in the 'DoctorTreatements' collection with the current user's UID as the document ID
    CollectionReference userTreatmentsRef =
        _collection.doc(uid).collection("userTreatments");
    userTreatmentsRef.add({
      'image': imgUrl,
      'doctor_name': drname,
      'note': note,
      'date': date
    }).then((value) {
      // Reset the form fields
      drNameController.clear();
      noteController.clear();
      dateController.clear();

      // Remove the image
      setState(() {
        myImage = null;
      });

      // Hide the progress indicator
      Navigator.of(context).pop();

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Data stored successfully',
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
    });
  }
}
