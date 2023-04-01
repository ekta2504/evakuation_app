import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/image_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/navigation_route_constants.dart';
import 'package:flutter_boilerplate/src/base/utils/navigation_utils.dart';

import '../../../base/dependencyinjection/locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _startTimer() {
    Timer(const Duration(seconds: 3), () {
      // Navigator.of(context).pushReplacementNamed('/login_screen');
      locator<NavigationUtils>().pushAndRemoveUntil(routeLogin);
    });
  }

  @override
  void initState() {
    super.initState();
     _startTimer();
    // Navigate to your app's main screen after a short delay
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
           // color: Colors.black,
            // height: 150, 
            // width: 150, 
            child: Image.asset(
              imlogo,
            ),
          ),
        ],
      ),
      
    );
  }
}
