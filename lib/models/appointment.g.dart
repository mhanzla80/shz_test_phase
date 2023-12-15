// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      id: json['id'] as String,
      childName: json['childName'] as String,
      hospitalName: json['hospitalName'] as String,
      hospitalEmail: json['hospitalEmail'] as String,
      parentName: json['parentName'] as String,
      phoneNo: json['phoneNo'] as String,
      reference: json['reference'] as String,
      appDate: json['appDate'] as String,
      status: $enumDecode(_$AppointmentStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'childName': instance.childName,
      'hospitalName': instance.hospitalName,
      'hospitalEmail': instance.hospitalEmail,
      'parentName': instance.parentName,
      'phoneNo': instance.phoneNo,
      'reference': instance.reference,
      'appDate': instance.appDate,
      'status': _$AppointmentStatusEnumMap[instance.status]!,
    };

const _$AppointmentStatusEnumMap = {
  AppointmentStatus.scheduled: 'scheduled',
  AppointmentStatus.confirmed: 'confirmed',
  AppointmentStatus.cancelled: 'cancelled',
  AppointmentStatus.completed: 'completed',
  AppointmentStatus.pending: 'pending',
  AppointmentStatus.rescheduled: 'rescheduled',
};
