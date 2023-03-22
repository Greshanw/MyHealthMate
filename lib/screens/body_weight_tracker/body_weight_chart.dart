import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_chart/d_chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BodyWeightChart extends StatefulWidget {
  const BodyWeightChart({super.key});

  @override
  State<BodyWeightChart> createState() => _BodyWeightChartState();
}

class _BodyWeightChartState extends State<BodyWeightChart> {
  User? user = FirebaseAuth.instance.currentUser;
  final collection = FirebaseFirestore.instance.collection('weights');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        title: const Text(
          "Health Manager",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          StreamBuilder(
              stream: collection
                  .doc(user!.uid)
                  .collection('userWeights')
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something Went Wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }
                List listChart = snapshot.data!.docs.map((e) {
                  return {
                    'domain': e.data()['date'],
                    'measure': e.data()['weight'],
                  };
                }).toList();
                return AspectRatio(
                  aspectRatio: 12 / 17,
                  child: DChartBar(
                    data: [
                      {
                        'id': 'Bar',
                        'data': listChart,
                      }
                    ],
                    axisLineColor: Colors.green,
                    barColor: (barData, index, id) => Colors.green,
                    showBarValue: true,
                  ),
                );
              })
        ],
      ),
    );
  }
}
