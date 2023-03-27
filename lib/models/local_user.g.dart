// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalUser _$LocalUserFromJson(Map<String, dynamic> json) => LocalUser(
      email: json['email'] as String,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      imagePath: json['imagePath'] as String?,
      role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']) ??
          UserRole.player,
      onlineStatus: json['onlineStatus'] as bool? ?? false,
      gamesPlayed: json['gamesPlayed'] as int? ?? 0,
      hoursPlayed: json['hoursPlayed'] as num? ?? 0,
      score: json['score'] as int? ?? 0,
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$LocalUserToJson(LocalUser instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'imagePath': instance.imagePath,
      'role': _$UserRoleEnumMap[instance.role],
      'onlineStatus': instance.onlineStatus,
      'gamesPlayed': instance.gamesPlayed,
      'hoursPlayed': instance.hoursPlayed,
      'fcmToken': instance.fcmToken,
      'score': instance.score,
    };

const _$UserRoleEnumMap = {
  UserRole.player: 'player',
  UserRole.coach: 'coach',
  UserRole.organization: 'organization',
};
