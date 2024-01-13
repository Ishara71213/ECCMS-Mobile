import 'package:eccms/Core/Utils/navigator_handler.dart';
import 'package:eccms/Core/constants/user_types.dart';
import 'package:eccms/config/routes/route_const.dart';
import 'package:eccms/config/theme/app_themes.dart';
import 'package:eccms/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:eccms/features/auth/presentation/bloc/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:developer' as dev;

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  const BottomNavBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  List<String> data = [
    'assets/icons/Home.svg',
    'assets/icons/chat.svg',
    'assets/icons/Settings.svg',
  ];

  List<String> iconNames = ['Home', 'Complains', 'Settings'];

  @override
  void initState() {
    setState(() {
      selectedIndex = widget.selectedIndex;
      dev.log(selectedIndex.toString());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16.0),

      width: double.infinity,
      height: 60, // Increased the height to accommodate the icon names
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(data.length, (index) {
              String iconName = iconNames[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (index == 0) {
                      NavigationHandler.navigateByUserType(
                          context,
                          RouteConst.homeOfficerUserScreen,
                          RouteConst.homeAdminUserScreen,
                          RouteConst.homeGuestUserScreen);
                    } else if (index == 1) {
                      if (BlocProvider.of<UserCubit>(context).userType ==
                          UserTypes.guest) {
                        NavigationHandler.navigate(
                            context, RouteConst.inquiryPostScreen);
                      } else {
                        NavigationHandler.navigate(
                            context, RouteConst.inquiryPostScreen);
                      }
                    } else if (index == 2) {
                      BlocProvider.of<AuthCubit>(context).signOut();
                    }
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Align the icon and text in the center
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: SvgPicture.asset(
                        data[index],
                        height: 25,
                        // ignore: deprecated_member_use
                        color: selectedIndex == index
                            ? Colors.white.withOpacity(0.9)
                            : Colors.white.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      iconName,
                      style: TextStyle(
                        color: selectedIndex == index
                            ? Colors.white.withOpacity(0.9)
                            : Colors.white.withOpacity(0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
