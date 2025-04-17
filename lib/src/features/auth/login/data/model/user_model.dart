import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String name;

  @JsonKey(name: 'last_name')
  final String lastName;

  final String email;
  final String phone;
  final String? image;
  final String? address;

  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
    this.image,
    this.address,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
