import 'package:json_annotation/json_annotation.dart';
import 'package:playon/all_utils.dart';

part 'local_user.g.dart';

@JsonSerializable(explicitToJson: true)
class LocalUser {
  final String email;
  final String? name;
  final String? phone;
  final String? imagePath;
  final UserRole role;
  final bool onlineStatus;
  final int gamesPlayed;
  final num hoursPlayed;
  final String? fcmToken;
  final int score;

  const LocalUser({
    required this.email,
    this.name,
    this.phone,
    this.imagePath,
    this.role = UserRole.player,
    this.onlineStatus = false,
    this.gamesPlayed = 0,
    this.hoursPlayed = 0,
    this.score = 0,
    this.fcmToken,
  });

  factory LocalUser.fromJson(Map<String, dynamic> json) =>
      _$LocalUserFromJson(json);

  Map<String, dynamic> toJson() => _$LocalUserToJson(this);
}
