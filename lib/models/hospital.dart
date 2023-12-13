import 'package:json_annotation/json_annotation.dart';

part 'hospital.g.dart';

@JsonSerializable(explicitToJson: true)
class Hospital {
  final String id;
  final String hospitalName;
  final String email;
  final String phoneNo;
  final String address;
  final String aboutHospital;
  final bool? isAccepted;

  const Hospital({
    required this.id,
    required this.hospitalName,
    required this.email,
    required this.phoneNo,
    required this.address,
    required this.aboutHospital,
    this.isAccepted,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) =>
      _$HospitalFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalToJson(this);
}
