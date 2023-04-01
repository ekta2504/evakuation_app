import 'package:json_annotation/json_annotation.dart';

part 'req_register_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ReqRegisterModel {
  @JsonKey(name: 'full_name')
  String? fullname;
  String? email;
  String? password;
  String? mobile;
  String? lang;
  String? deviceType;

  ReqRegisterModel(
      {this.fullname,
      this.email,
      this.password,
      this.mobile,
      this.lang,
      this.deviceType});

  factory ReqRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$ReqRegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReqRegisterModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResRegisterModel {
  int? code;
  String? msg;

  ResRegisterModel({this.code, this.msg});

  factory ResRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$ResRegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResRegisterModelToJson(this);
}
