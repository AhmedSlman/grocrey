import 'package:json_annotation/json_annotation.dart';

part 'sign_up_responce_model.g.dart'; // ✅ أضف السطر ده فوق الكلاس

@JsonSerializable()
class SignUpResponceModel {
  String? message;

  SignUpResponceModel({this.message});

  factory SignUpResponceModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponceModelToJson(this);
}
