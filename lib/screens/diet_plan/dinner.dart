import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dinner_view.dart';
//import '../healthy-recipe/components/bottom_nav.dart';

class DietDinner extends StatefulWidget {
  const DietDinner({Key? key}) : super(key: key);

  @override
  State<DietDinner> createState() => _DietDinnerState();
}

class _DietDinnerState extends State<DietDinner> {
  // Text fields' controllers
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _ingredController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final CollectionReference _dietDinner =
  FirebaseFirestore.instance.collection('dietdinner');

  // ADD DINNER FUNCTION
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
                  controller: _topicController,
                  decoration: const InputDecoration(
                    // icon: Icon(Icons.man),
                      labelText: 'Topic'
                  ),
                ),
                TextField(
                  controller: _ingredController,
                  decoration: const InputDecoration(
                    // icon: Icon(Icons.man),
                      labelText: 'Ingredients'
                  ),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    // icon: Icon(Icons.man),
                      labelText: 'Description'
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 160),
                      backgroundColor: Colors.purple
                  ),
                  child: const Text('Submit',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    final String topic = _topicController.text;
                    final String ingredients = _ingredController.text;
                    final String description = _descriptionController.text;

                    if (_topicController.value.text.isNotEmpty && _ingredController.value.text.isNotEmpty && _descriptionController.value.text.isNotEmpty) {
                      await _dietDinner.add({"topic": topic, "ingredients": ingredients, "description": description}).then((value) {
                        Get.snackbar('Success', 'Successfully Saved');
                      });
                      _topicController.text = '';
                      _ingredController.text = '';
                      _descriptionController.text = '';
                      Navigator.of(context).pop();
                    }
                    else{
                      if(_topicController.value.text.isEmpty){
                        Get.snackbar('Failed', 'Topic Cannot Be Empty');
                      }
                      else if(_ingredController.value.text.isEmpty){
                        Get.snackbar('Failed', 'Ingredients Cannot Be Empty');
                      }
                      else{
                        Get.snackbar('Failed', 'Description Cannot Be Empty');
                      }
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // UPDATE DINNER FUNCTION
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _topicController.text = documentSnapshot['topic'];
      _ingredController.text = documentSnapshot['ingredients'];
      _descriptionController.text = documentSnapshot['description'];
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
                  controller: _topicController,
                  decoration: const InputDecoration(
                    // icon: Icon(Icons.man),
                      labelText: 'Topic'),
                ),
                TextField(
                  controller: _ingredController,
                  decoration: const InputDecoration(
                    // icon: Icon(Icons.man),
                      labelText: 'Ingredients'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    // icon: Icon(Icons.man),
                      labelText: 'Description'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 150),
                      backgroundColor: Colors.orange
                  ),
                  child: const Text( 'Update',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    final String topic = _topicController.text;
                    final String ingredients = _ingredController.text;
                    final String description = _descriptionController.text;
                    if (topic != null) {
                      await _dietDinner
                          .doc(documentSnapshot!.id)
                          .update({"topic": topic, "ingredients": ingredients, "description": description}).then((value) {
                        Get.snackbar('Success', 'Successfully Updated');
                      });
                      _topicController.text = '';
                      _ingredController.text = '';
                      _descriptionController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // DELETE DINNER FUNCTION
  Future<void> _delete(String recordId) async {
    await _dietDinner.doc(recordId).delete().then((value) {
      Get.snackbar('Success', 'Successfully Deleted');
    });
    Navigator.pop(context);
  }

  // VIEW DINNER
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(
          leading: IconButton(
              icon: SvgPicture.asset('assets/icons/back.svg'),
              onPressed: () {
                Navigator.pop(context);
              }
          ),
          elevation:4,
          centerTitle:false,
          automaticallyImplyLeading: false,
          backgroundColor:Color(0xffc396e5),
          shape:RoundedRectangleBorder(
            borderRadius:BorderRadius.zero,
          ),
          title:Text(
            "Health Manager",
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
                    shadowColor: Colors.purpleAccent,
                    margin: const EdgeInsets.all(13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.9),
                    ),
                    child: ListTile(
                      title: Text(
                        documentSnapshot['topic'],
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: SizedBox(
                        width: 192,
                        child: Row(
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xEFEFEFFF),
                                shape: CircleBorder(),
                              ),
                              child: Icon(
                                Icons.remove_red_eye,
                                color: Colors.blue,
                              ),
                              onPressed: () => _navigateToDietDinnerView(context),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xEFEFEFFF),
                                shape: CircleBorder(),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Color(0xFFFFA000),
                              ),
                              onPressed: () => _update(documentSnapshot),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xEFEFEFFF),
                                shape: CircleBorder(),
                              ),
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
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
                                  onPressed: () => _delete(documentSnapshot.id),
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
        // Add new product
        floatingActionButton: FloatingActionButton(
          onPressed: () => _create(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }

  void _navigateToDietDinnerHome(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DietDinner()));
  }
  void _navigateToDietDinnerView(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DietDinnerView()));
  }
}
