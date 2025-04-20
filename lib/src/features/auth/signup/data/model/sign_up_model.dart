import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  String? name;
  String? last_name;
  String? email;
  String? password;
  String? phone;
  String? password_confirmation;

  SignUpModel({
    this.name,
    this.last_name,
    this.email,
    this.password,
    this.phone,
    this.password_confirmation,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
}
