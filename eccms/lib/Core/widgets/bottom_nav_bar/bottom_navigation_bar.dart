import 'package:eccms/Core/Utils/functions/navigator_handler.dart';
import 'package:eccms/Core/enum/constants/constants.dart';
import 'package:eccms/Core/routes/route_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    'assets/icons/Community.svg',
    'assets/icons/chat.svg',
    'assets/icons/Guide.svg',
    // 'assets/icons/navigation-Products.svg',
  ];

  List<String> iconNames = ['Home', 'Community', 'Requests', 'Guide'];

  @override
  void initState() {
    setState(() {
      selectedIndex = widget.selectedIndex;
      print(selectedIndex);
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
                      navigationHandlerByUserType(
                          context,
                          RouteConst.homeOfficerUserScreen,
                          RouteConst.homeAdminUserScreen,
                          RouteConst.homeGuestUserScreen);
                    } else if (index == 1) {
                      // navigationHandler(
                      //     context, RouteConst.communityPostsScreen);
                    } else if (index == 2) {
                      // navigationHandler(
                      //     context, RouteConst.volunteerSupportScreen);
                    } else if (index == 3) {
                      // navigationHandler(context, RouteConst.guideScreen);
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
