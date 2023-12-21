import 'dart:async';

import 'package:eccms/Core/enum/constants/constants.dart';
import 'package:eccms/Core/widgets/bottom_nav_bar/bottom_navigation_bar.dart';
import 'package:eccms/features/auth/presentation/bloc/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart' as li;

class HomeGuestUserScreen extends StatefulWidget {
  const HomeGuestUserScreen({super.key});

  @override
  State<HomeGuestUserScreen> createState() => _HomeAdminUserScreenState();
}

class _HomeAdminUserScreenState extends State<HomeGuestUserScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    UserCubit userCubit = BlocProvider.of<UserCubit>(context);
    Size size = MediaQuery.of(context).size;
    LatLng currentLocation = const LatLng(6.8393012, 79.9003934);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // const Padding(padding: EdgeInsets.all(8.0), child: CommonAppBar()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 8),
                  child: SvgPicture.asset(
                    "assets/images/Volunteering.svg",
                    alignment: Alignment.center,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                              child: Text(
                            'Welcome ${BlocProvider.of<UserCubit>(context).userData?.firstName ?? ""}',
                            style: kOnboardScreenTitle,
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
                            "Hi Thank you for suporting to protect nature",
                            style: kOnboardScreenText,
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
