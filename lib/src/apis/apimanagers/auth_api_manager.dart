import 'package:flutter_boilerplate/src/apis/api_route_constant.dart';
import 'package:flutter_boilerplate/src/apis/api_service.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/models/req_login_model.dart';
import 'package:flutter_boilerplate/src/models/req_register_model.dart';
import 'package:flutter_boilerplate/src/models/req_reset_model.dart';

class AuthApiManager {
  Future<ResLoginModel> login(ReqLoginModel request) async {
    final response = await locator<ApiService>().post(
      apiLogin,
      data: request.toJson(),
    );
    return ResLoginModel.fromJson(response?.data);
  }

  Future<ResRegisterModel> register(ReqRegisterModel request) async {
    final response = await locator<ApiService>().post(
      apiRegister,
      data: request.toJson(),
    );
    return ResRegisterModel.fromJson(response?.data);
  }

  Future<ResResetModel> reset(ReqResetModel request) async {
    final response = await locator<ApiService>().post(
      apiReset,
      data: request.toJson(),
    );
    return ResResetModel.fromJson(response?.data);
  }
}
