import 'package:cached_network_image/cached_network_image.dart';
import 'package:eccms/Core/widgets/bottom_nav_bar/bottom_navigation_bar.dart';
import 'package:eccms/features/auth/presentation/bloc/user/cubit/user_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeOfficerUserScreen extends StatefulWidget {
  const HomeOfficerUserScreen({super.key});

  @override
  State<HomeOfficerUserScreen> createState() => _HomeOfficerUserScreenState();
}

class _HomeOfficerUserScreenState extends State<HomeOfficerUserScreen> {
  @override
  Widget build(BuildContext context) {
    UserCubit userCubit = BlocProvider.of<UserCubit>(context);
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
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
