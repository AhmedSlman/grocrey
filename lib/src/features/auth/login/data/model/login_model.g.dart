// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponce _$LoginResponceFromJson(Map<String, dynamic> json) =>
    LoginResponce(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginResponceToJson(LoginResponce instance) =>
    <String, dynamic>{'user': instance.user, 'token': instance.token};
