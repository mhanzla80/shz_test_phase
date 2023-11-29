import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playon/models/appointment.dart';
import 'package:playon/utils/storage/prefs_storage.dart';

class ViewAppointmentsScreen extends StatelessWidget {
  static const String routeName = "/ViewAppointmentsScreen";

  const ViewAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder<List<Appointment>>(
        future: _getAppointments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                  style: const TextStyle(fontSize: 18),
                ),
              );
            }

            final data = snapshot.data;
            if (data != null && data.isNotEmpty) {
              return ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: data.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: ListTile(
                      title: Text(data[index].childName),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                  child: Text(
                'No Data',
                style: TextStyle(fontSize: 18),
              ));
            }
          }

          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }

  Future<List<Appointment>> _getAppointments() async {
    // Reference to your Firestore collection
    final childrenCollection =
        FirebaseFirestore.instance.collection('appointments');

    // Query to retrieve children where the 'email' field matches the provided email
    final querySnapshot = await childrenCollection
        .where('reference', isEqualTo: PrefsStorage.instance.user?.email)
        .get();

    // Process the retrieved documents
    final children = querySnapshot.docs;

    final List<Appointment> childrenList = [];
    for (var child in children) {
      // Access data within each document
      final data = child.data();
      childrenList.add(Appointment.fromJson(data));
      // Do something with the data
      print('Child: ${data.toString()}');
    }
    return childrenList;
  }
}
