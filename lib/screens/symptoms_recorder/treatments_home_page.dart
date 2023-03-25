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
  // Navigates to the TreatementsHistoryPage when called
  void _navigateToTreatementsHistory(BuildContext context) {
    // Navigates to a new page in the app by pushing a new MaterialPageRoute onto the navigation stack
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const UserTreatmentsPage()));
  }

  File? myImage; // A nullable object that may contain an image file

  TextEditingController drNameController = TextEditingController(); // A text input field controller for the doctor name
  TextEditingController noteController = TextEditingController(); // A text input field controller for notes 
  TextEditingController dateController = TextEditingController(); // A text input field controller for the date
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
            // Closes the current screen and returns to the previous screen
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
          // Sets the height and width of the widget to the maximum available space
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(// A widget that enables scrolling of content that exceeds the available space
            physics: const BouncingScrollPhysics(//adds a bouncing effect to a scroll view
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
                          color: const Color(0xFF5CB85C),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          textColor: const Color(0xff000000),
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
                          textColor: const Color(0xff000000),
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
                    controller: drNameController,// A controller object for managing the text field's content
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
                      controller: dateController,// A controller object for managing the text field's content
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
                        // A method that shows a date picker dialog and sets the selected date in the corresponding TextField widget
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(), // The initial date to show in the picker
                          firstDate: DateTime(
                              2000), // The earliest date that can be selected
                          lastDate: DateTime(2101), // The latest date that can be selected
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
                              pickedDate); // Print the selected date
                          String formattedDate = DateFormat('yyyy-MM-dd').format(
                              pickedDate); // Format the date
                          print(
                              formattedDate); // Print the formatted date

                          setState(() {
                            dateController.text =
                                formattedDate; // Set the formatted date in the corresponding TextField
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
                    controller: noteController, // A controller object for managing the text field's content
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
                InkWell(// A rectangular area of the screen that responds to touch events
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
                            child: myImage == null // check if myImage is null
                                ? const Center(
                                    child: Image( // use the default image
                                          image: AssetImage('images/photo.png'),
                                          width: 40,
                                          height: 40),
                                  )
                                : Image.file( // if myImage is not null, display the image from the file
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
          return SafeArea( // SafeArea widget is used to avoid elements from being obstructed by device's status bar
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Take a photo'),
                  onTap: () {
                    Navigator.pop(context); // Close the bottom sheet when user taps on an option.
                    getImage(ImageSource.camera); // Open the device's camera to capture doctor treatment.
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Choose from gallery'),
                  onTap: () {
                    Navigator.pop(context);// Close the bottom sheet when user taps on an option.
                    getImage(ImageSource.gallery); // Open the device's gallery to choose an image.
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

  final ImagePicker _picker = ImagePicker();// create a new instance of ImagePicker
  getImage(ImageSource source) async {//function that takes an ImageSource parameter
    // use the ImagePicker instance to get an image from the specified source
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {// if the image is not null
      myImage = File(image.path);// set myImage to the image's file path
      // uplodaFile();
      setState(() {});
      Get.back();// close the dialog
    }
  }

  void uplodaFile() async {
    
    final file = myImage;// Get the file to upload from myImage

    // Create metadata for the file
    final metaData = SettableMetadata(contentType: 'image/jpeg');
    // Get the Firebase Storage reference
    final storageRef = FirebaseStorage.instance.ref();
    // Set the reference path
    Reference ref = storageRef
        .child('pictures/${DateTime.now().microsecondsSinceEpoch}.jpg');
    // Start the upload task with the file and metadata
    final uploadTask = ref.putFile(file!, metaData);

    uploadTask.snapshotEvents.listen((event) {// Listen for snapshot events from the upload task
      switch (event.state) {
        case TaskState.running:// When the task is running
          print("file is uploading");//print this message
          break;
        case TaskState.success:// When the task is successful
          ref.getDownloadURL().then((value) => storeEntry(value,
              drNameController.text, noteController.text, dateController.text));// Get the download URL for the file and store it along with other details
          break;
      }
    });
  }

  storeEntry(String imgUrl, String drname, String note, String date) {
    
    // Get the current user's UID
    String uid = FirebaseAuth.instance.currentUser!.uid;

    // Get a reference to the 'DoctorTreatements' collection
    final CollectionReference _collection =
        FirebaseFirestore.instance.collection('DoctorTreatements');
        
    // Show the progress indicator while the data is being stored
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
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
      const SnackBar(
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
