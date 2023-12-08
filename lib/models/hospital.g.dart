// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hospital _$HospitalFromJson(Map<String, dynamic> json) => Hospital(
      hospitalName: json['hospitalName'] as String,
      email: json['email'] as String,
      phoneNo: json['phoneNo'] as String,
      address: json['address'] as String,
      aboutHospital: json['aboutHospital'] as String,
      isAccepted: json['isAccepted'] as bool?,
    );

Map<String, dynamic> _$HospitalToJson(Hospital instance) => <String, dynamic>{
      'hospitalName': instance.hospitalName,
      'email': instance.email,
      'phoneNo': instance.phoneNo,
      'address': instance.address,
      'aboutHospital': instance.aboutHospital,
      'isAccepted': instance.isAccepted,
    };
