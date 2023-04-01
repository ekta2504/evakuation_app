import 'package:json_annotation/json_annotation.dart';

part 'req_reset_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ReqResetModel {
  String? email;
  String? lang;

  ReqResetModel({this.email, this.lang});

  factory ReqResetModel.fromJson(Map<String, dynamic> json) =>
      _$ReqResetModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReqResetModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResResetModel {
 int? code;
  String? msg;
  List? response;

  ResResetModel({this.code, this.msg, this.response});

  factory ResResetModel.fromJson(Map<String, dynamic> json) =>
      _$ResResetModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResResetModelToJson(this);
}

