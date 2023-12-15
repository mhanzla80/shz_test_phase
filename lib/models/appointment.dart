import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable(explicitToJson: true)
class Appointment {
  final String id;
  final String childName;
  final String hospitalName;
  final String hospitalEmail;
  final String parentName;
  final String phoneNo;
  final String reference;
  final String appDate;
  final AppointmentStatus status;

  const Appointment({
    required this.id,
    required this.childName,
    required this.hospitalName,
    required this.hospitalEmail,
    required this.parentName,
    required this.phoneNo,
    required this.reference,
    required this.appDate,
    required this.status,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}

enum AppointmentStatus {
  scheduled,
  confirmed,
  cancelled,
  completed,
  pending,
  rescheduled,
}
