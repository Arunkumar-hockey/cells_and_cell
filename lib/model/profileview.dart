// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

ProfileModel profileFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.id,
    required this.name,
    required this.profileId,
    required this.isAdmin,
    required this.email,
    this.emailVerifiedAt,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int profileId;
  int isAdmin;
  String email;
  dynamic emailVerifiedAt;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"],
    name: json["name"],
    profileId: json["profile_id"],
    isAdmin: json["is_admin"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "profile_id": profileId,
    "is_admin": isAdmin,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
