import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/utils/localization/localization.dart';
import 'package:flutter_boilerplate/src/base/utils/navigation_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MaterialErrorDialog extends StatelessWidget {
  final String message;
  final String? okTitle;
  final Function()? okFunction;
  final bool isCancelEnable;

  const MaterialErrorDialog(
      {Key? key,
      required this.message,
      this.okTitle,
      this.okFunction,
      this.isCancelEnable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)?.appName ?? ''),
      content: Text(message),
      actions: isCancelEnable
          ? [_getOkAction(context), _getCancelAction(context)]
          : [_getOkAction(context)],
    );
  }

  _getOkAction(context) {
    return TextButton(
      child: Text(okTitle ?? AppLocalizations.of(context)?.ok ?? ''),
      onPressed: () {
        locator<NavigationUtils>().pop();
        if (okFunction != null) {
          okFunction!();
        }
      },
    );
  }

  _getCancelAction(context) {
    return TextButton(
      child: Text(AppLocalizations.of(context)?.cancel ?? ''),
      onPressed: () {
        locator<NavigationUtils>().pop();
      },
    );
  }
}
