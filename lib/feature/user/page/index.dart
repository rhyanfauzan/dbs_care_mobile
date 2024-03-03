// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print, import_of_legacy_library_into_null_safe, deprecated_member_use

import 'package:bottom_bar/bottom_bar.dart';
import 'package:dbs_care/feature/user/page/History/History.dart';
import 'package:dbs_care/feature/user/page/Tracking/tracking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/app_asset.dart';
import '../../../config/theme.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  _IndexState();
  // final UserController userController = Get.put(UserController());

  int _currentPage = 0;
  final _pageController = PageController();

  bool isAvatar = false;

  @override
  Widget build(BuildContext context) {
    // return Obx(() {
      // if (userController.userInfo.value?.data?.id == null) {
      //   return const LoginBack();
      // } else {
        return Scaffold(
          body: PageView(
            controller: _pageController,
            children: const [
              HistoryPage(),
              TrackingPage(),
              HistoryPage(),
              HistoryPage(),
            ],
            onPageChanged: (index) {
              // Use a better state management solution
              // setState is used for simplicity
              setState(() => _currentPage = index);
            },
          ),
          bottomNavigationBar: BottomBar(
            selectedIndex: _currentPage,
            onTap: (int index) {
              _pageController.jumpToPage(index);
              setState(() => _currentPage = index);
            },
            items: <BottomBarItem>[
              BottomBarItem(
                  icon: SvgPicture.asset(AppAsset.iconHome,
                      color: _currentPage == 0 ? whiteColor : greyColor),
                  title: Text(
                    'History',
                    style: whiteTextStyle,
                  ),
                  activeColor: primaryColor,
                  backgroundColorOpacity: 1,
                  activeTitleColor: whiteColor),
              BottomBarItem(
                  icon: SvgPicture.asset(AppAsset.iconSearch,
                      color: _currentPage == 1 ? whiteColor : greyColor),
                  title: Text(
                    'Tracking',
                    style: whiteTextStyle,
                  ),
                  activeColor: primaryColor,
                  backgroundColorOpacity: 1,
                  activeTitleColor: whiteColor),
              BottomBarItem(
                  icon: SvgPicture.asset(AppAsset.iconSaved,
                      color: _currentPage == 2 ? whiteColor : greyColor),
                  title: Text(
                    'Saved',
                    style: whiteTextStyle,
                  ),
                  activeColor: primaryColor,
                  backgroundColorOpacity: 1,
                  activeTitleColor: whiteColor),
              BottomBarItem(
                  icon: SvgPicture.asset(AppAsset.iconProfile,
                      color: _currentPage == 3 ? whiteColor : greyColor),
                  title: Text(
                    'Profile',
                    style: whiteTextStyle,
                  ),
                  activeColor: primaryColor,
                  backgroundColorOpacity: 1,
                  activeTitleColor: whiteColor),
            ],
          ),
        );
      // }
    // });
  }
}

// class LoginBack extends StatelessWidget {
//   const LoginBack({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DelayedDisplay(
//         delay: const Duration(seconds: 3),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Center(
//                   child: Text(
//                     'Session Time Out, Login Back',
//                     textAlign: TextAlign.center,
//                     style: blackTextStyle.copyWith(
//                         fontSize: 20, fontWeight: medium),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 Image.asset(
//                   AppAsset.ilNothing,
//                   width: 250,
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 CustomFilledButton(
//                   title: 'Back to Login',
//                   onPressed: () {
//                     Get.delete<UserController>();
//                     Get.offAllNamed('/login');
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
