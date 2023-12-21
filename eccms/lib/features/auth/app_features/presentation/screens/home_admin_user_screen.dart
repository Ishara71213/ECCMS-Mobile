import 'dart:async';
import 'package:eccms/Core/widgets/bottom_nav_bar/bottom_navigation_bar.dart';
import 'package:eccms/features/auth/presentation/bloc/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart' as li;

class HomeAdminUserScreen extends StatefulWidget {
  const HomeAdminUserScreen({super.key});

  @override
  State<HomeAdminUserScreen> createState() => _HomeAdminUserScreenState();
}

class _HomeAdminUserScreenState extends State<HomeAdminUserScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    UserCubit userCubit = BlocProvider.of<UserCubit>(context);
    //AdminCubit adminCubit = BlocProvider.of<AdminCubit>(context);
    Size size = MediaQuery.of(context).size;
    LatLng currentLocation = const LatLng(6.8393012, 79.9003934);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.all(8.0), child: SizedBox.shrink()),
            const SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Column(
                  children: [],
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
