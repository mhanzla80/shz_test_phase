import 'dart:io';

import 'package:flutter/material.dart';
import 'package:playon/models/cv_data_model.dart';

class ChildrenDataProvider extends ChangeNotifier {
  int index = 0;
  File? imageFile;
  final childDataModel = ChildDataModel();

  void storePersonalInfoFormStep1(
      String firstName,
      String lastName,
      String email,
      String phoneNo,
      String address,
      String designation,
      String aboutYou) {
    childDataModel.firstName = firstName;
    childDataModel.lastName = lastName;
    childDataModel.email = email;
    childDataModel.phoneNo = phoneNo;
    childDataModel.address = address;
    childDataModel.aboutHim = aboutYou;
  }
}
