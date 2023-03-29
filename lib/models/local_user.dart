import 'package:json_annotation/json_annotation.dart';

part 'local_user.g.dart';

@JsonSerializable(explicitToJson: true)
class LocalUser {
  final String email;
  final String? name;
  final String? phone;

  const LocalUser({
    required this.email,
    this.name,
    this.phone,
  });

  factory LocalUser.fromJson(Map<String, dynamic> json) =>
      _$LocalUserFromJson(json);

  Map<String, dynamic> toJson() => _$LocalUserToJson(this);
}
