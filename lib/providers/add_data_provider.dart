import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playon/all_utils.dart';

class AddDataProvider extends ChangeNotifier {
  final _children = FirebaseFirestore.instance.collection('children');
  final _hospitals = FirebaseFirestore.instance.collection('hospitals');

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
}
