import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/utils/localization/localization_en.dart';
import 'package:flutter_boilerplate/src/base/utils/navigation_utils.dart';
import 'package:intl/intl.dart';


class MyLocalizationsDelegate extends LocalizationsDelegate<Localization> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
      ].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) => _load(locale);

  static Future<Localization> _load(Locale locale) async {
    final String name =
        (locale.countryCode == null || locale.countryCode!.isEmpty)
            ? locale.languageCode
            : locale as String;

    final localeName = Intl.canonicalizedLocale(name);
    Intl.defaultLocale = localeName;

    

    // if( locale.languageCode == "ar" ) {
    //   return LocalizationAR();
    // } else {
    //  return LocalizationAR();
    // }

     return LocalizationEN();
     
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => false;
}

abstract class Localization {
  static Localization of() {
    return Localizations.of<Localization>(
        locator<NavigationUtils>().getCurrentContext, Localization)!;
  }

  // Common Strings
  String get internetNotConnected;
  String get poorInternetConnection;
  String get alertPermissionNotRestricted;
  String get appName;
  String get ok;
  String get cancel;
  String get edit;
  String get delete;
  String get done;
  String get logout;
  String get galleryTitle;
  String get cameraTitle;
  String get yes;
  String get no;
  String get save;
  String get search;
  String get otherDocuments;
  String get events;
  String get favourites;

  // Auth Stringd
  String get email;
  String get msgEmail;
  String get confirmPassword;
  String get msgConfirmPassword;
  String get msgPassword;
  String get password;
  String get logIn;
  String get noAcc;
  String get haveAcc;
  String get resetPassword;
  String get register;
  String get privacy;
  String get services;
  String get phoneNum;
  String get msgPhoneNum;
  String get name;
  String get msg;
  String get msgName;
  String get forgetPassword;
  String get msgEmailEmpty;
  String get msgEmailInvalid;
  String get msgPasswordEmpty;
  String get msgPasswordError;
  String get msgPasswordNotMatch;
  String get noNetwork;
  String get serverError;
  String get userName;
  String get forgotLoginDetail;
  String get helpWithSigningIn;
  String get signUp;
  String get submit;
  String get subScriptionType;
  String get firstName;
  String get lastName ;
  String get city ;
  String get birtDate;
  String get upload;
  String get calender;
  String get profile;
  String get searchResult;
  String get section;
  String get year;
  String get date;
  String get month;
  String get selectYourSubscriptionType;
  String get student;
  String get company;
  String get govenment;
  String get searchByWord;
  String get createEvents;
  String get editProfile;
  
}
