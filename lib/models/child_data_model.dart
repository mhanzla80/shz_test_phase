import 'package:json_annotation/json_annotation.dart';

part 'child_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ChildDataModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNo;
  final String age;
  final String address;
  final String aboutHim;
  final String parentEmail;

  const ChildDataModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.age,
    required this.address,
    required this.aboutHim,
    required this.parentEmail,
  });

  factory ChildDataModel.fromJson(Map<String, dynamic> json) =>
      _$ChildDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChildDataModelToJson(this);
}
