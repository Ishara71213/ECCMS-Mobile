import 'package:eccms/Core/Utils/navigator_handler.dart';
import 'package:eccms/Core/constants/user_types.dart';
import 'package:eccms/config/routes/route_const.dart';
import 'package:eccms/config/theme/app_themes.dart';
import 'package:eccms/features/auth/presentation/bloc/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashDataLoadScreen extends StatefulWidget {
  const SplashDataLoadScreen({super.key});

  @override
  State<SplashDataLoadScreen> createState() => _SplashDataLoadScreen();
}

class _SplashDataLoadScreen extends State<SplashDataLoadScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: SystemUiOverlay.values);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    Future<void> loadData() async {
      BlocProvider.of<UserCubit>(context).getCurrrentUserType().then((value) {
        Future.delayed(const Duration(seconds: 2), () {
          String user = BlocProvider.of<UserCubit>(context).userType;
          if (user == UserTypes.guest) {
            NavigationHandler.navigateByUserType(
                context,
                RouteConst.homeOfficerUserScreen,
                RouteConst.homeAdminUserScreen,
                RouteConst.homeGuestUserScreen);
          } else if (user == UserTypes.officer) {
            NavigationHandler.navigateByUserType(
                context,
                RouteConst.homeOfficerUserScreen,
                RouteConst.homeAdminUserScreen,
                RouteConst.homeGuestUserScreen);
          } else {
            NavigationHandler.navigateByUserType(
                context,
                RouteConst.homeOfficerUserScreen,
                RouteConst.homeAdminUserScreen,
                RouteConst.homeGuestUserScreen);
          }
        });
      });
    }

    loadData();

    return Scaffold(
      body: Container(
        color: kAppBgColor,
        child: Center(
          child: Opacity(
            opacity: 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 120,
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
