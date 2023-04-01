import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/context_extension.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/extensions/string_extension.dart';
import 'package:flutter_boilerplate/src/models/req_reset_model.dart';

import '../../../base/dependencyinjection/locator.dart';
import '../../../base/utils/constants/fontsize_constant.dart';
import '../../../base/utils/localization/localization.dart';
import '../../../controllers/auth/auth_controller.dart';
import '../../../models/req_register_model.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/primary_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final _emailController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: context.getHeight(0.9),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _resetPassword(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _getEmailTextField(),
                      _getRegisterButton(),
                    ],
                  ),
                ],
              ),
            )),
      ),
    ).homeScaffold(context: context);
  }

  callResetApi() {
    locator<AuthController>().resetApiCall(
        context: context,
        model: ReqResetModel(
          email: _emailController.text.trim(),
          lang: "en",
          //   deviceType: Platform.isIOS ? "ios" : "android",
        ));
  }

  Widget _resetPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Align(
        alignment: Alignment.topRight,
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)?.resetPassword ?? '',
              style: const TextStyle(
                  fontWeight: fontWeightBold, fontSize: fontSize30),
            )
          ],
        ),
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
        return value!.isValidEmail(context);
      },
    );
  }

  Widget _getRegisterButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child:
          PrimaryButton(AppLocalizations.of(context)?.resetPassword ?? '', () {
        if (_formKey.currentState!.validate()) {
          callResetApi();
        }
      }, false),
    );
  }
}
