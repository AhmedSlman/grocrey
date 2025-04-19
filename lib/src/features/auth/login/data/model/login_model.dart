import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginResponce {
  final UserModel user;
  final String token;

  LoginResponce({required this.user, required this.token});

  factory LoginResponce.fromJson(Map<String, dynamic> json) =>
      _$LoginResponceFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponceToJson(this);
}
