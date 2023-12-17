import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:playon/all_utils.dart';
import 'package:playon/models/appointment.dart';
import 'package:playon/models/child_data_model.dart';
import 'package:playon/models/hospital.dart';
import 'package:playon/models/role.dart';

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

  List<ChildDataModel>? allChildren;
  List<Hospital>? allHospitals;
  List<Appointment>? allAppointments;

  Future<List<Hospital>?> getAllHospitals() async {
    final isHospital = PrefsStorage.instance.user?.role == Role.hospital;
    final List<Hospital> hospitals = [];

    final snapshot = await _hospitals.get();
    if (!isHospital) {
      final docs = snapshot.docs;
      if (docs.isNotEmpty) {
        for (int i = 0; i < docs.length; i++) {
          hospitals.add(docs[i].data());
        }
        return hospitals;
      }
    }

    final docs = snapshot.docs
        .where((element) =>
            element.data().email == PrefsStorage.instance.user?.email)
        .toList();

    if (docs.isNotEmpty) {
      for (int i = 0; i < docs.length; i++) {
        hospitals.add(docs[i].data());
      }
      return hospitals;
    }
    return null;
  }

  Future<List<ChildDataModel>?> getAllChildren() async {
    final isAdmin = PrefsStorage.instance.user?.role == Role.admin;
    final List<ChildDataModel> children = [];

    final snapshot = await _children.get();
    if (isAdmin) {
      final docs = snapshot.docs;
      for (int i = 0; i < docs.length; i++) {
        children.add(docs[i].data());
      }
      return children;
    }

    final docs = snapshot.docs
        .where((element) =>
            element.data().parentEmail == PrefsStorage.instance.user?.email)
        .toList();

    if (docs.isNotEmpty) {
      for (int i = 0; i < docs.length; i++) {
        children.add(docs[i].data());
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

  Future<bool> updateAppStatus(Appointment appointment) async {
    EasyLoading.show();
    await _bookAppointment.doc(appointment.id).set(appointment).then((value) {
      EasyLoading.showSuccess("Status updated");
      return true;
    }).catchError((error) {
      EasyLoading.showError("Status couldn't be update.\n${error.toString()}");
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

  void changePassword(String newPassword) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      EasyLoading.show();
      try {
        await user.updatePassword(newPassword);
        EasyLoading.showSuccess('Password changed successfully');
      } catch (error) {
        EasyLoading.showError('Password change failed: $error');
        // Handle the error accordingly
      }
    } else {
      EasyLoading.showError('No user signed in');
      // Handle the case where no user is signed in
    }
  }
}
