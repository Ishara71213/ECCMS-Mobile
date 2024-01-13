import 'package:eccms/Core/widgets/bottom_nav_bar/bottom_navigation_bar.dart';
import 'package:eccms/config/theme/app_themes.dart';
import 'package:eccms/features/auth/presentation/bloc/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    Size size = MediaQuery.sizeOf(context);
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
          child: SingleChildScrollView(
        child: Column(
          children: [
            // const Padding(padding: EdgeInsets.all(8.0), child: CommonAppBar()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 8, top: 22),
                  child: SvgPicture.asset(
                    "assets/images/protectNature.svg",
                    alignment: Alignment.center,
                    height: size.height - 380,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                              child: Text(
                            'Welcome ${BlocProvider.of<UserCubit>(context).userData?.firstName ?? ""}',
                            style: kContactTextStyle,
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Flexible(
                              child: Text(
                            "Thank you for your dedication to wildlife and forestry conservation.",
                            style: kGreyBodytextStyle,
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
