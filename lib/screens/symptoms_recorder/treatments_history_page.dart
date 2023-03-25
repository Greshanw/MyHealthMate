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
        .collection('DoctorTreatements')// get the top-level collection 'DoctorTreatements'
        .doc(uid)// get the document corresponding to the current user's UID
        .collection('userTreatments');// get the subcollection 'userTreatments' of the current user's document
  }

  Future<void> _deleteTreatment(String id) async {
    try {
      // Deletes the document with the given id from Firestore.
      await userTreatmentsRef.doc(id).delete(); 
      // Shows a Snackbar notification to indicate that the treatment has been deleted successfully.
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Treatment deleted',
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
      

    } catch (e) {
      // Shows a Snackbar notification to indicate that an error occurred while deleting the treatment.
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Failed to delete treatment',
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
  }

  // Define a Future function to update the treatment details 
  Future<void> _updateTreatment(
      String id, String doctorName, String note, String date) async {
    try {
      // Update the treatment details in the database with the given id, doctorName, note and date
      await userTreatmentsRef.doc(id).update({
        'doctor_name': doctorName,
        'note': note,
        'date': date,
      });
      // Close the current screen
      Navigator.of(context).pop();
      // Show a snackbar message to indicate that the treatment details are updated successfully
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Treatment updated',
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
      ;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar (
    content: Text(
      'Error Occured while Updating',
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
  }

  void _showUpdateModal(String id, String currentDoctorName, String currentNote,
      String currentDate, String imageFile) {

    // Create text editing controllers for each input field and set their initial values
    final doctorNameController = TextEditingController(text: currentDoctorName);
    final noteController = TextEditingController(text: currentNote);
    final dateController = TextEditingController(text: currentDate);

    // Initialize _imageFile variable with the value of imageFile argument
    String _imageFile = imageFile;

    // Define a function to select and set an image from the device's gallery or camera
    Future<void> _getImage(ImageSource source) async {
      final pickedFile = await ImagePicker().getImage(source: source);
      if (pickedFile != null) {
        // If an image is selected, set its path to _imageFile variable and re-render the widget
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
        title: const Text(
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
                const SizedBox(height: 10),
                InkWell(// Allow the user to select or take a photo by tapping on the image container
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SafeArea(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Option to take a photo using the camera
                              ListTile(
                                leading: const Icon(Icons.camera_alt),
                                title: const Text('Take a photo'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _getImage(ImageSource.camera);
                                },
                              ),
                              // Option to choose a photo from the device's gallery
                              ListTile(
                                leading: const Icon(Icons.photo_library),
                                title: const Text('Choose from gallery'),
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
                  // Display the selected image or an icon to add an image
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
                const SizedBox(height: 10),
                TextField(
                  controller: doctorNameController,
                  decoration: InputDecoration(
                    hintText: 'Doctor Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: noteController,
                  decoration: InputDecoration(
                    hintText: 'Note',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: 'Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
                            colorScheme: const ColorScheme.light(
                              primary: Color(0xFF5CB85C), 
                              onPrimary: Colors.black87, 
                              onSurface: Colors.black87, 
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                primary: Colors.black87, 
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
                  const SnackBar(
                    content: Text('Please fill all fields'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF5CB85C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Update',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get the current user object from the FirebaseAuth instance
    final currentUser = FirebaseAuth.instance.currentUser;

    // get a reference to the 'userTreatments' collection for the current user's doctor treatments
    final userTreatmentsRef = FirebaseFirestore.instance
        .collection('DoctorTreatements')
        .doc(currentUser!.uid) // set the document id to the current user's id
        .collection('userTreatments'); // get a reference to the 'userTreatments' collection

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            height: 32,
            width: 32,
            child: const CircleAvatar(
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
        backgroundColor: const Color(0xFF5CB85C),
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
      body: StreamBuilder<QuerySnapshot>(
        // The stream is the userTreatmentsRef.snapshots() stream
        stream: userTreatmentsRef.snapshots(),
        builder: (context, snapshot) {
          // If the snapshot doesn't have any data yet, show a CircularProgressIndicator in the center
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // If the snapshot has data, get the list of document snapshots from the data field
          final treatments = snapshot.data!.docs;

          if (treatments.isEmpty) {
            return const Center(child: Text('No treatments added yet.'));
          }

          return ListView.builder(
            // Set the number of items in the list to the length of the treatments array.
            itemCount: treatments.length,
            itemBuilder: (context, index) {
              // Get the treatment at the specified index in the treatments array.
              final treatment = treatments[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF5CB85C),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Container(
                                // This line sets the width of the Container to 80% of the width of the screen.
                                width: MediaQuery.of(context).size.width * 0.8,
                                // This line sets the height of the Container to 80% of the height of the screen.
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: Image.network(//displays the image of the treatment.
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
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _deleteTreatment(treatment.id);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
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
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
