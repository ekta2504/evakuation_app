import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/apis/api_route_constant.dart';
import 'package:flutter_boilerplate/src/apis/api_service.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/extensions/context_extension.dart';
import 'package:flutter_boilerplate/src/base/extensions/string_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/common_methods.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/app_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/image_constant.dart';
import 'package:flutter_boilerplate/src/models/req_login_model.dart';
import 'package:flutter_boilerplate/src/widgets/custom_button.dart';
import 'package:flutter_boilerplate/src/widgets/primary_text_field.dart';
import '../../../base/extensions/scaffold_extension.dart';
import '../../../base/utils/constants/navigation_route_constants.dart';
import '../../../base/utils/navigation_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../src/controllers/auth/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: context.getHeight(0.9),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //  mainAxisSize: MainAxisSize.min,
                  children: [
                    _logo(images: imlogo),
                    _getEmailTextField(),
                    const SizedBox(height: 8.0),
                    _getPasswordTextField(),
                    const SizedBox(height: 1.0),
                    _getForgetPassword(),
                    _getLoginButton(),
                  ],
                ),
                _getRegisterButton(),
              ],
            ),
          ),
        ),
      ),
    ).authContainerScaffold(context: context);
  }

  Widget _logo({required String images}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 90),
      child: Image.asset(
        images,
        width: context.getWidth(),
        height: context.getHeight(0.1),
      ),
    );
  }

  Widget _getEmailTextField() {
    return PrimaryTextField(
      label: AppLocalizations.of(context)?.email ?? '',
      hint: AppLocalizations.of(context)?.msgEmail ?? '',
      focusNode: _emailFocus,
      type: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: _emailController,
      onFieldSubmitted: (value) {
        _emailFocus.unfocus();
        _passwordFocus.requestFocus();
      },
      validateFunction: (value) {
        return value?.isValidEmail(context);
      },
    );
  }

  Widget _getPasswordTextField() {
    return PrimaryTextField(
      isObscureText: true,
      label: AppLocalizations.of(context)?.password ?? '',
      hint: AppLocalizations.of(context)?.msgPassword ?? '',
      focusNode: _passwordFocus,
      type: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      controller: _passwordController,
      onFieldSubmitted: (value) {
        _passwordFocus.unfocus();
      },
      validateFunction: (value) {
        return value?.isValidPassword(context);
      },
    );
  }

  Widget _getForgetPassword() {
    return TextButton(
      onPressed: () {
        locator<NavigationUtils>().push(routeReset);
      },
      style: TextButton.styleFrom(foregroundColor: Colors.grey),
      child: Text(AppLocalizations.of(context)?.forgetPassword ?? ''),
    );
  }

  //Api call
  callLoginApi() {
     locator<AuthController>().loginApiCall(
        context: context,
        model: ReqLoginModel(
            email: _emailController.text,
            password: _passwordController.text,
            lang: "en"));
    // logger(response.toString());
  }

  Widget _getLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: PrimaryButton((AppLocalizations.of(context)?.logIn ?? ''), () {
        if (_formKey.currentState!.validate()) {
          callLoginApi();
        }
      }, false),
    );
  }

  Widget _getRegisterButton() {
    return Column(
      children: [
        Text(AppLocalizations.of(context)?.noAcc ?? ''),
        PrimaryButton((AppLocalizations.of(context)?.register ?? ''), () {
          locator<NavigationUtils>().push(routeRegister);
        }, true),
      ],
    );
  }
}
