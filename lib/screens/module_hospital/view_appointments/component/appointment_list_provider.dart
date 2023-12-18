import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playon/models/appointment.dart';
import 'package:playon/models/role.dart';
import 'package:playon/utils/my_extensions.dart';
import 'package:playon/utils/storage/prefs_storage.dart';

class AppointmentListProvider extends ChangeNotifier {
  List<Appointment> list = [];
  List<Appointment> filteredList = [];
  final _bookAppointment = FirebaseFirestore.instance
      .collection('appointments')
      .withConverter<Appointment>(
        fromFirestore: (snapshot, _) => Appointment.fromJson(snapshot.data()!),
        toFirestore: (appointment, _) => appointment.toJson(),
      );

  Future<List<Appointment>> getAppointments() async {
    // Reference to your Firestore collection
    String field = '';
    if (PrefsStorage.instance.user?.role == Role.hospital) {
      field = 'hospitalEmail';
    } else {
      field = 'reference';
    }

    // Query to retrieve children where the 'email' field matches the provided email
    final querySnapshot = await _bookAppointment
        .where(field, isEqualTo: PrefsStorage.instance.user?.email)
        .get();

    // Process the retrieved documents
    final appointments = querySnapshot.docs;

    final List<Appointment> childrenList = [];
    for (var child in appointments) {
      // Access data within each document
      final data = child.data();
      childrenList.add(data);
      // Do something with the data
      print('Child: ${data.toString()}');
    }
    list = childrenList;
    filteredList = childrenList;
    return childrenList;
  }

  void filterByDays(int days) {
    final current = DateTime.now().subtract(Duration(days: days));

    filteredList = list
        .where((e) => e.appDate.toDateTime().isAfter(current))
        .toList(growable: false);

    notifyListeners();
  }
}
