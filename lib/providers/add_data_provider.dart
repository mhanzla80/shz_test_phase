import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playon/all_utils.dart';
import 'package:playon/models/appointment.dart';
import 'package:playon/models/child_data_model.dart';
import 'package:playon/models/hospital.dart';

class AddDataProvider extends ChangeNotifier {
  final _children = FirebaseFirestore.instance
      .collection('children')
      .withConverter<ChildDataModel>(
        fromFirestore: (snapshot, _) =>
            ChildDataModel.fromJson(snapshot.data()!),
        toFirestore: (childDataModel, _) => childDataModel.toJson(),
      );

  final _hospitals = FirebaseFirestore.instance
      .collection('hospitals')
      .withConverter<Hospital>(
        fromFirestore: (snapshot, _) => Hospital.fromJson(snapshot.data()!),
        toFirestore: (hospital, _) => hospital.toJson(),
      );

  final _bookAppointment = FirebaseFirestore.instance
      .collection('appointments')
      .withConverter<Appointment>(
        fromFirestore: (snapshot, _) => Appointment.fromJson(snapshot.data()!),
        toFirestore: (appointment, _) => appointment.toJson(),
      );

  List<String>? allChildren;
  List<String>? allHospitals;

  Future<List<String>?> getAllHospitals() async {
    final snapshot = await _hospitals.get();
    final docs = snapshot.docs;
    if (docs.isNotEmpty) {
      final List<String> hospitals = [];
      for (int i = 0; i < docs.length; i++) {
        hospitals.add(docs[i].data().hospitalName);
      }
      return hospitals;
    }
    return null;
  }

  Future<List<String>?> getAllChildren() async {
    final snapshot = await _children.get();
    final docs = snapshot.docs
        .where((element) =>
            element.data().parentEmail == PrefsStorage.instance.user?.email)
        .toList();
    if (docs.isNotEmpty) {
      final List<String> children = [];
      for (int i = 0; i < docs.length; i++) {
        children.add(docs[i].data().firstName);
      }
      return children;
    }
    return null;
  }

  Future<bool> addChildToDB(ChildDataModel childDataModel) async {
    EasyLoading.show();
    await _children.doc(childDataModel.id).set(childDataModel).then((value) {
      EasyLoading.showSuccess("Child data Added");
      return true;
    }).catchError((error) {
      EasyLoading.showError("Child couldn't be added.\n${error.toString()}");
      return false;
    });
    return false;
  }

  Future<bool> addHospitalToDB(Hospital hospital) async {
    EasyLoading.show();
    await _hospitals.doc(hospital.id).set(hospital).then((value) {
      EasyLoading.showSuccess("Hospital data Added");
      return true;
    }).catchError((error) {
      EasyLoading.showError("Hospital couldn't be added.\n${error.toString()}");
      return false;
    });
    return false;
  }

  Future<bool> bookAppointment(Appointment appointment) async {
    EasyLoading.show();
    await _bookAppointment.doc(appointment.id).set(appointment).then((value) {
      EasyLoading.showSuccess("Appointment Booked Successfully");
      return true;
    }).catchError((error) {
      EasyLoading.showError("Appointment failed to Book.\n${error.toString()}");
      return false;
    });
    return false;
  }

  Future<bool> acceptRejectHospital(Hospital hospital, bool isAccepted) async {
    EasyLoading.show();
    hospital.isAccepted = isAccepted;
    await _hospitals.doc(hospital.id).update(hospital.toJson()).then((value) {
      EasyLoading.showSuccess("Hospital Status Updated Successfully");
      return true;
    }).catchError((error) {
      EasyLoading.showError(
          "Hospital Status failed to Updated.\n${error.toString()}");
      return false;
    });
    return false;
  }
}
