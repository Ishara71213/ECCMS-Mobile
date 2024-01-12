import 'package:eccms/Core/widgets/bottom_nav_bar/bottom_navigation_bar.dart';
import 'package:eccms/config/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeOfficerUserScreen extends StatefulWidget {
  const HomeOfficerUserScreen({super.key});

  @override
  State<HomeOfficerUserScreen> createState() => _HomeOfficerUserScreenState();
}

class _HomeOfficerUserScreenState extends State<HomeOfficerUserScreen> {
  @override
  Widget build(BuildContext context) {
    //UserCubit userCubit = BlocProvider.of<UserCubit>(context);
    //Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 70,
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: CircleAvatar(
              radius: 38.0,
              backgroundColor: kAppBgMediumShade,
              child: ClipOval(
                child: SvgPicture.asset(
                  'assets/icons/avatar-default.svg',
                  height: 50,
                ),
              ),
            ),
          ),
          onTap: () {},
        ),
        backgroundColor: kAppBgColor,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // BlocBuilder<ProfileCubit, ProfileState>(
              //   builder: (context, state) {
              //     return const CommonAppBar();
              //   },
              // ),
              const SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [],
                      )),
                ],
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
