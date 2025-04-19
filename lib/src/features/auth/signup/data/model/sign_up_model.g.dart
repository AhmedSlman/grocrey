// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  phone: json['phone'] as String?,
  passwordConfirmation: json['passwordConfirmation'] as String?,
);

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'passwordConfirmation': instance.passwordConfirmation,
    };
