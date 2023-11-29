import 'package:json_annotation/json_annotation.dart';

part 'child_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ChildDataModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNo;
  final String address;
  final String aboutHim;

  const ChildDataModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.address,
    required this.aboutHim,
  });

  factory ChildDataModel.fromJson(Map<String, dynamic> json) =>
      _$ChildDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChildDataModelToJson(this);
}
