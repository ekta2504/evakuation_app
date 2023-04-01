import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/context_extension.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/extensions/string_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/common_methods.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/navigation_route_constants.dart';
import 'package:flutter_boilerplate/src/models/req_register_model.dart';

import '../../../base/dependencyinjection/locator.dart';
import '../../../base/utils/constants/app_constant.dart';
import '../../../base/utils/localization/localization.dart';
import '../../../base/utils/navigation_utils.dart';
import '../../../controllers/auth/auth_controller.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/primary_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();
  final _phoneNum = FocusNode();
  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                _register(),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                SingleChildScrollView(
                  primary: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Container(
                    height: context.getHeight(1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _getName(),
                        _getEmailTextField(),
                        _getPasswordTextField(),
                        _getConfirmPasswordTextField(),
                        _getPhoneNum(),
                        _getCheckBox(_isChecked, (value) {
                          setState(() {
                            _isChecked = !_isChecked;
                          });
                        }),
                        const Padding(padding: EdgeInsets.only(bottom: 9)),
                        _getRegisterButton(),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10)),
                        _getLoginButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    ).homeScaffold(context: context);
  }

  Widget _register() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              AppLocalizations.of(context)?.register ?? '',
              style: const TextStyle(
                fontWeight: fontWeightBold,
                fontSize: fontSize30,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getName() {
    return PrimaryTextField(
        hint: AppLocalizations.of(context)?.msgName ?? '',
        label: AppLocalizations.of(context)?.name ?? '',
        focusNode: _nameFocus,
        type: TextInputType.text,
        textInputAction: TextInputAction.next,
        controller: _nameController);
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
      textInputAction: TextInputAction.next,
      controller: _passwordController,
      onFieldSubmitted: (value) {
        _passwordFocus.unfocus();
      },
      validateFunction: (value) {
        return value?.isValidPassword(context);
      },
    );
  }

  Widget _getConfirmPasswordTextField() {
    return PrimaryTextField(
      isObscureText: true,
      label: AppLocalizations.of(context)?.confirmPassword ?? '',
      hint: AppLocalizations.of(context)?.msgConfirmPassword ?? '',
      focusNode: _confirmPasswordFocus,
      type: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      controller: _confirmPasswordController,
      onFieldSubmitted: (value) {
        _passwordFocus.unfocus();
      },
      validateFunction: (value) {
        return value?.isValidPassword(context);
      },
    );
  }

  Widget _getPhoneNum() {
    return PrimaryTextField(
        hint: AppLocalizations.of(context)?.msgPhoneNum ?? '',
        label: AppLocalizations.of(context)?.phoneNum ?? '',
        focusNode: _phoneNum,
        type: TextInputType.phone,
        textInputAction: TextInputAction.done,
        controller: _phoneController);
  }

  Widget _getCheckBox(bool isChecked, void Function(bool?) onChange) {
    return CheckboxListTile(
      enabled: true,
      title: RichText(
          text: TextSpan(
              text: AppLocalizations.of(context)?.msg ?? '',
              style: const TextStyle(color: Colors.grey, fontSize: fontSize12),
              children: <TextSpan>[
            TextSpan(
                text: AppLocalizations.of(context)?.privacy ?? '',
                style: const TextStyle(
                    color: primaryColor,
                    decoration: TextDecoration.underline,
                    fontWeight: fontWeightBold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    locator<NavigationUtils>().push(routePrivacy);
                  }),
            const TextSpan(
              text: ' and ',
              style: TextStyle(color: Colors.grey),
            ),
            TextSpan(
                text: AppLocalizations.of(context)?.services ?? '',
                style: const TextStyle(
                    color: primaryColor,
                    decoration: TextDecoration.underline,
                    fontWeight: fontWeightBold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    locator<NavigationUtils>().push(routePrivacy);
                  }),
            const TextSpan(
              text: '.',
              style: TextStyle(color: Colors.grey),
            ),
          ])),
      //  title: const Text("By clicking on Register/Sign up you agreed to our Privacy Policy and Terms of Services.", style: TextStyle(fontSize: fontSize12),),
      controlAffinity: ListTileControlAffinity.leading,
      value: isChecked,
      onChanged: onChange,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    );
  }

  //api call
  callRegisterApi() {
    locator<AuthController>().registerApiCall(
        context: context,
        model: ReqRegisterModel(
          fullname: _nameController.text,
          email: _emailController.text.trim(),
          password: _passwordController.text,
          mobile: _phoneController.text,
          lang: "en",
          deviceType: Platform.isIOS ? "ios" : "android",
        ));
  }

  Widget _getRegisterButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: PrimaryButton((AppLocalizations.of(context)?.register ?? ''), () {
        if (_formKey.currentState!.validate()) {
          callRegisterApi();
        }
      }, false),
    );
  }

  Widget _getLoginButton() {
    return Column(
      children: [
        Text(AppLocalizations.of(context)?.haveAcc ?? ''),
        PrimaryButton((AppLocalizations.of(context)?.logIn ?? ''), () {
          locator<NavigationUtils>().push(routeLogin);
        }, true),
      ],
    );
  }
}
