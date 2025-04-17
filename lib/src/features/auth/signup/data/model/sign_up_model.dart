import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? passwordConfirmation;

  SignUpModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.passwordConfirmation,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
}
