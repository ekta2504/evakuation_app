import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/navigation_route_constants.dart';
import 'package:flutter_boilerplate/src/ui/auth/screens/events_screen.dart';
import 'package:flutter_boilerplate/src/ui/auth/screens/favourites_screen.dart';
import 'package:flutter_boilerplate/src/ui/auth/screens/file_screen.dart';
import 'package:provider/provider.dart';

import '../base/utils/constants/color_constant.dart';
import '../base/utils/constants/image_constant.dart';
import '../base/utils/localization/localization.dart';
import '../providers/tabbar_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomerTabbar extends StatefulWidget {
  const CustomerTabbar({Key? key}) : super(key: key);

  @override
  State<CustomerTabbar> createState() => _CustomerTabbarState();
}

class _CustomerTabbarState extends State<CustomerTabbar> {
  final List<Widget> _children = [
    const FileScreen(),
    const EventScreen(),
    const FavouriteScreen(),
  ];

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerTabProvider>(
      builder: (context, data, child) => Scaffold(
        body: _children[data.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          mouseCursor: SystemMouseCursors.click,
          elevation: 10.0,
          backgroundColor: primaryColor,
          currentIndex: data.currentIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          onTap: (index) {
            data.setIndex(index);
          },
          unselectedItemColor: secondaryColor,
          showUnselectedLabels: true,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          items: [
            _getBottomNavigationBarItem(
                title: AppLocalizations.of(context)?.otherDocuments ?? '',
                icon: icDocuments,
                isSelected: data.currentIndex == 0),
            _getBottomNavigationBarItem(
                title: AppLocalizations.of(context)?.events ?? '',
                icon: icEvents,
                isSelected: data.currentIndex == 1),
            _getBottomNavigationBarItem(
                title: AppLocalizations.of(context)?.favourites ?? '',
                icon: icFavourites,
                isSelected: data.currentIndex == 2),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _getBottomNavigationBarItem(
      {required String icon, required String title, required bool isSelected}) {
    return BottomNavigationBarItem(
      label: title,
      tooltip: "",
      icon: MouseRegion(
        opaque: true,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SvgPicture.asset(
            icon,
            height: 25,
            width: 25,
            color: isSelected ? primaryColor : secondaryColor,
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({Key? key}) : super(key: key);

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int _currentIndex = 0; 

//   final List<Widget>_children=[
  
//   ];
  
//   void onTabTapped(int index){
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//           body: _children[_currentIndex],
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: _currentIndex,
//             onTap: onTabTapped,
//             items: const [
//               BottomNavigationBarItem(icon:Icon(Icons.folder),label: 'File'),
//               BottomNavigationBarItem(icon:Icon(Icons.calendar_month_outlined),label: 'event'),
//               BottomNavigationBarItem(icon:Icon(Icons.favorite_outline),label: 'Favourites'),
//             ],
//           ),
//     );
//   }
  
// }