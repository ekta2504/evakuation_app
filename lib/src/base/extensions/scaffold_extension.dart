import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../dependencyinjection/locator.dart';
import '../utils/constants/image_constant.dart';
import '../utils/constants/navigation_route_constants.dart';
import '../utils/navigation_utils.dart';

extension ScaffoldExtension on Widget {
  Scaffold authContainerScaffold({required BuildContext context}) {
    return Scaffold(
      body: SafeArea(
        child: this,
      ),
    );
  }

  Scaffold homeScaffold({required BuildContext context}) {
    // final String text;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.only(top: 30),
                  icon: SvgPicture.asset(
                    icBack,
                    height: 25,
                    width: 25,
                  ),
                  onPressed: () {
                    locator<NavigationUtils>().push(routeLogin);
                  },
                ),
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
        child: this,
      ),
      bottomNavigationBar: SizedBox(
        height: 0.0,
      ),
    );
  }

  Dialog dialogContainer({double height = 350}) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 20.0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        height: height,
        padding: const EdgeInsets.all(20.0),
        child: this,
      ),
    );
  }
}
