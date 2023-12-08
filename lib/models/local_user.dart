import 'package:json_annotation/json_annotation.dart';
import 'package:playon/models/role.dart';

part 'local_user.g.dart';

@JsonSerializable(explicitToJson: true)
class LocalUser {
  final String email;
  final String? name;
  final String? phone;
  final Role? role;

  const LocalUser({
    required this.email,
    this.name,
    this.phone,
    this.role,
  });

  factory LocalUser.fromJson(Map<String, dynamic> json) =>
      _$LocalUserFromJson(json);

  Map<String, dynamic> toJson() => _$LocalUserToJson(this);
}
