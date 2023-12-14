import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable(explicitToJson: true)
class Appointment {
  final String id;
  final String childName;
  final String hospital;
  final String parentName;
  final String phoneNo;
  final String reference;
  final String appDate;

  const Appointment({
    required this.id,
    required this.childName,
    required this.hospital,
    required this.parentName,
    required this.phoneNo,
    required this.reference,
    required this.appDate,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
