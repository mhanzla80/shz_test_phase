import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playon/all_utils.dart';

class AddDataProvider extends ChangeNotifier {
  final _children = FirebaseFirestore.instance.collection('children');
  final _hospitals = FirebaseFirestore.instance.collection('hospitals');
  final _bookAppointment =
      FirebaseFirestore.instance.collection('appointments');
  List<String>? allChildren;
  List<String>? allHospitals;

  Future<List<String>?> getAllHospitals() async {
    final snapshot = await _hospitals.get();
    final docs = snapshot.docs;
    if (docs.isNotEmpty) {
      final List<String> hospitals = [];
      for (int i = 0; i < docs.length; i++) {
        hospitals.add(docs[i].data()['hospitalName']);
      }
      return hospitals;
    }
    return null;
  }

  Future<List<String>?> getAllChildren() async {
    final snapshot = await _children.get();
    final docs = snapshot.docs
        .where((element) =>
            element.data()['reference'] == PrefsStorage.instance.user?.email)
        .toList();
    if (docs.isNotEmpty) {
      final List<String> children = [];
      for (int i = 0; i < docs.length; i++) {
        children.add(docs[i].data()['firstName']);
      }
      return children;
    }
    return null;
  }

  Future<bool> addChildToDB(String firstName, String lastName, String email,
      String phoneNo, String address, String age, String aboutYou) async {
    EasyLoading.show();
    await _children.add({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'age': age,
      'phoneNo': phoneNo,
      'address': address,
      'aboutYou': aboutYou,
      'reference': PrefsStorage.instance.user?.email,
    }).then((value) {
      EasyLoading.showSuccess("Child data Added");
      return true;
    }).catchError((error) {
      EasyLoading.showError("Child couldn't be added.\n${error.toString()}");
      return false;
    });
    return false;
  }

  Future<bool> addHospitalToDB(String hospitalName, String email,
      String phoneNo, String address, String aboutHospital) async {
    EasyLoading.show();
    await _hospitals.add({
      'hospitalName': hospitalName,
      'email': email,
      'phoneNo': phoneNo,
      'address': address,
      'aboutHospital': aboutHospital,
    }).then((value) {
      EasyLoading.showSuccess("Hospital data Added");
      return true;
    }).catchError((error) {
      EasyLoading.showError("Hospital couldn't be added.\n${error.toString()}");
      return false;
    });
    return false;
  }

  Future<bool> bookAppointment(String childName, String hospital) async {
    EasyLoading.show();
    await _bookAppointment.add({
      'childName': childName,
      'hospital': hospital,
      'parentName': PrefsStorage.instance.user?.name,
      'phoneNo': PrefsStorage.instance.user?.phone,
      'reference': PrefsStorage.instance.user?.email,
    }).then((value) {
      EasyLoading.showSuccess("Appointment Booked Successfully");
      return true;
    }).catchError((error) {
      EasyLoading.showError("Appointment failed to Book.\n${error.toString()}");
      return false;
    });
    return false;
  }
}
