import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/image_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopNavbar extends StatefulWidget {
  const TopNavbar({Key? key}) : super(key: key);

  @override
  State<TopNavbar> createState() => _TopNavbarState();
}

class _TopNavbarState extends State<TopNavbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(actions: [
      IconButton(icon: SvgPicture.asset(icBack, height: 25, width: 25,),onPressed: (){
         
      },)
    ],).authContainerScaffold(context: context);
  }
}