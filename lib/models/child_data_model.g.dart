// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChildDataModel _$ChildDataModelFromJson(Map<String, dynamic> json) =>
    ChildDataModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNo: json['phoneNo'] as String,
      address: json['address'] as String,
      aboutHim: json['aboutHim'] as String,
    );

Map<String, dynamic> _$ChildDataModelToJson(ChildDataModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNo': instance.phoneNo,
      'address': instance.address,
      'aboutHim': instance.aboutHim,
    };
