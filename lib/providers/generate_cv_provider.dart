import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playon/all_utils.dart';

class ChildrenDataProvider extends ChangeNotifier {
  int index = 0;
  File? imageFile;
  CollectionReference children =
      FirebaseFirestore.instance.collection('children');

  Future<void> addChildToDB(String firstName, String lastName, String email,
      String phoneNo, String address, String age, String aboutYou) async {
    EasyLoading.show();
    await children
        .add({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'age': age,
          'phoneNo': phoneNo,
          'address': address,
          'aboutYou': aboutYou,
          'reference': PrefsStorage.instance.user?.email,
        })
        .then((value) => EasyLoading.showSuccess("Child data Added"))
        .catchError(
            (error) => EasyLoading.showError("Child couldn't be added."));
  }
}
