import 'package:json_annotation/json_annotation.dart';

part 'req_login_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ReqLoginModel {
  String? email;
  String? password;
  String? lang;

  ReqLoginModel({this.email, this.password, this.lang});

  factory ReqLoginModel.fromJson(Map<String, dynamic> json) =>
      _$ReqLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReqLoginModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResLoginModel {
  int? code;
  String? msg;
  Response? response;

  ResLoginModel({this.code, this.msg, this.response});

  factory ResLoginModel.fromJson(Map<String, dynamic> json) =>
      _$ResLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResLoginModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Response {
  int? userId;
  UserInfo? userInfo;

  Response({this.userId, this.userInfo});
  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserInfo {
  int? id;
  int? roleId;
  String? level;
  String? name;
  String? firstName;
  String? lastName;
  String? fullName;
  String? photo;
  String? email;
  String? password;
  String? rememberToken;
  int? cityId;
  String? mobile;
  String? deviceType;
  String? subscriptionType;
  String? emailVerified;
  String? emailVerifiedToken;
  String? activated;
  String? uploadFile;
  bool? allowedByAdmin;
  int? walletBalance;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  bool? active;
  bool? isSubscribed;
  String? accessToken;

  UserInfo(
      {this.id,
      this.roleId,
      this.level,
      this.name,
      this.firstName,
      this.lastName,
      this.fullName,
      this.photo,
      this.email,
      this.password,
      this.rememberToken,
      this.cityId,
      this.mobile,
      this.deviceType,
      this.subscriptionType,
      this.emailVerified,
      this.emailVerifiedToken,
      this.activated,
      this.uploadFile,
      this.allowedByAdmin,
      this.walletBalance,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.active,
      this.isSubscribed,
      this.accessToken});

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
