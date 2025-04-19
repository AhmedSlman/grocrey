// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
  name: json['name'] as String?,
  last_name: json['last_name'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  phone: json['phone'] as String?,
  password_confirmation: json['password_confirmation'] as String?,
);

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'last_name': instance.last_name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'password_confirmation': instance.password_confirmation,
    };
