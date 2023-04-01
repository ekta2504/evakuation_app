import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/apis/apimanagers/auth_api_manager.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/navigation_route_constants.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/preference_key_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/navigation_utils.dart';
import 'package:flutter_boilerplate/src/base/utils/preference_utils.dart';
import 'package:flutter_boilerplate/src/models/req_login_model.dart';
import 'package:flutter_boilerplate/src/models/req_register_model.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/models/req_reset_model.dart';

import '../../widgets/toast_message.dart';

class AuthController {
  void loginApiCall(
      {required BuildContext context, required ReqLoginModel model}) async {
    await locator<AuthApiManager>().login(model).then((value) => {
          if (value.code == 1)
            {
              showToast(value.msg ?? ""),
              locator<NavigationUtils>().push(routeTabBar),
            }
          else
            {
              showToast(value.msg ?? ""),
              locator<NavigationUtils>().push(routeLogin),
            }
        });
  }

  void registerApiCall(
      {required BuildContext context, required ReqRegisterModel model}) async {
    await locator<AuthApiManager>().register(model).then((value) => {
          if (value.code == 1)
            {
              showToast(value.msg ?? ''),
            }
          else
            {
              showToast(value.msg ?? ""),
            }
        });
  }

  void resetApiCall(
      {required BuildContext context, required ReqResetModel model}) async {
    await locator<AuthApiManager>().reset(model);
  }

  setRegisterData(ResLoginModel data) {
    setString(prefkeyToken, data.response?.userInfo?.accessToken ?? '');
    getString(prefkeyId);
  }
}
