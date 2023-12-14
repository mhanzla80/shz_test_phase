// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      id: json['id'] as String,
      childName: json['childName'] as String,
      hospital: json['hospital'] as String,
      parentName: json['parentName'] as String,
      phoneNo: json['phoneNo'] as String,
      reference: json['reference'] as String,
      appDate: json['appDate'] as String,
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'childName': instance.childName,
      'hospital': instance.hospital,
      'parentName': instance.parentName,
      'phoneNo': instance.phoneNo,
      'reference': instance.reference,
      'appDate': instance.appDate,
    };
