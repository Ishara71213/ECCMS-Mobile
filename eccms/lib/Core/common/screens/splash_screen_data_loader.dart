import 'package:eccms/Core/Utils/functions/navigator_handler.dart';
import 'package:eccms/Core/enum/constants/constants.dart';
import 'package:eccms/Core/enum/constants/user_types.dart';
import 'package:eccms/Core/routes/route_const.dart';
import 'package:eccms/features/auth/presentation/bloc/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
    Size size = MediaQuery.of(context).size;

    Future<void> loadData() async {
      BlocProvider.of<UserCubit>(context).getCurrrentUserType().then((value) {
        Future.delayed(const Duration(seconds: 2), () {
          String user = BlocProvider.of<UserCubit>(context).userType;
          // if (user == UserTypes.officer) {
          //   BlocProvider.of<ViuserCubit>(context)
          //       .getCurrrentUserdata()
          //       .then((value) {
          //     navigationHandlerByUserType(
          //         context,
          //         RouteConst.HomeOfficerUserScreen,
          //         RouteConst.HomeAdminUserScreen,
          //         RouteConst.HomeGuestUserScreen);
          //   });
          // } else if (user == UserTypes.officer) {
          //   BlocProvider.of<GuardianCubit>(context)
          //       .getCurrrentUserdata()
          //       .then((value) {
          //     navigationHandlerByUserType(
          //         context,
          //         RouteConst.HomeOfficerUserScreen,
          //         RouteConst.HomeAdminUserScreen,
          //         RouteConst.HomeGuestUserScreen);
          //   });
          // } else {
          //   navigationHandlerByUserType(
          //       context,
          //       RouteConst.HomeOfficerUserScreen,
          //       RouteConst.HomeAdminUserScreen,
          //       RouteConst.HomeGuestUserScreen);
          // }
        });
      });
    }

    loadData();

    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        child: Center(
          child: Opacity(
            opacity: 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/visionmate-logo.svg',
                  height: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Vision Mate",
                  style: kLogoTextstyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
