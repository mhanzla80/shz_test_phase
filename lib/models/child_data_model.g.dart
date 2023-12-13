// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChildDataModel _$ChildDataModelFromJson(Map<String, dynamic> json) =>
    ChildDataModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNo: json['phoneNo'] as String,
      age: json['age'] as String,
      address: json['address'] as String,
      aboutHim: json['aboutHim'] as String,
      parentEmail: json['parentEmail'] as String,
    );

Map<String, dynamic> _$ChildDataModelToJson(ChildDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNo': instance.phoneNo,
      'age': instance.age,
      'address': instance.address,
      'aboutHim': instance.aboutHim,
      'parentEmail': instance.parentEmail,
    };
