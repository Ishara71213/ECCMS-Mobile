import 'package:eccms/Core/common/presentation/screens/splash_screen.dart';
import 'package:eccms/Core/common/presentation/screens/splash_screen_data_loader.dart';
import 'package:eccms/config/routes/route_const.dart';
import 'package:eccms/features/inquiry/presentation/screens/home_guest_user_screen.dart';
import 'package:eccms/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:eccms/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:eccms/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:eccms/features/inquiry/presentation/screens/inquiry_post_screen.dart';
import 'package:eccms/features/inquiry/presentation/screens/inquiry_screen.dart';
import 'package:eccms/features/inquiry/presentation/screens/officer/officer_inquiry_post_screen.dart';
import 'package:eccms/features/organization/presentation/screens/home_admin_user_screen.dart';
import 'package:eccms/features/organization/presentation/screens/home_officer_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    //final args = settings.arguments;
    String routeName = settings.name.toString();
    switch (settings.name) {
      case RouteConst.initialRoute:
        return materialBuilderAuthScreens(
            widget: const SignInScreen(), route: routeName);
      case RouteConst.splashScreen:
        return materialBuilder(widget: const SplashScreen(), route: routeName);
      case RouteConst.splashDataLoadScreen:
        return materialBuilder(
            widget: const SplashDataLoadScreen(), route: routeName);
      case RouteConst.signInScreen:
        return materialBuilderAuthScreens(
            widget: const SignInScreen(), route: routeName);
      case RouteConst.signUpScreen:
        return materialBuilderAuthScreens(
            widget: const SignUpScreen(), route: routeName);

      //home screens
      case RouteConst.homeAdminUserScreen:
        return materialBuilder(
            widget: const HomeAdminUserScreen(), route: routeName);
      case RouteConst.homeOfficerUserScreen:
        return materialBuilder(
            widget: const HomeOfficerUserScreen(), route: routeName);
      case RouteConst.homeGuestUserScreen:
        return materialBuilder(
            widget: const HomeGuestUserScreen(), route: routeName);

      case RouteConst.inquiryPostScreen:
        return materialBuilder(
            widget: const InquiryPostScreen(), route: routeName);
      case RouteConst.inquiryScreen:
        return materialBuilder(widget: const InquiryScreen(), route: routeName);
      case RouteConst.officerInquiryPostScreen:
        return materialBuilder(
            widget: const OfficerInquiryPostScreen(), route: routeName);

      //common screens
      // case RouteConst.settingsScreen:
      //   return materialBuilder(
      //       widget: const SettingsScreen(), route: routeName);
      // case RouteConst.profileScreen:
      //   return materialBuilder(widget: const ProfileScreen(), route: routeName);
      // case RouteConst.editProfileScreen:
      //   return materialBuilder(
      //       widget: const EditProfileScreen(), route: routeName);
      //error page
      default:
        return MaterialPageRoute(builder: (context) => const ErrorPage());
    }
  }
}

//use this function to generate routes only for auth screens
//since its return the argument(widget) if user not authenticated
MaterialPageRoute materialBuilderAuthScreens(
    {required Widget widget, required String route}) {
  return MaterialPageRoute(
      settings: RouteSettings(name: route),
      builder: (context) => BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is Authenticated) {
                // String? previousRouteName =
                //     ModalRoute.of(context)?.settings.name.toString();

                return const SplashDataLoadScreen();
              } else if (state is UnAuthenticated) {
                return widget;
              } else {
                return const SignInScreen();
              }
            },
          ));
}

//use this function to generate routes only for auth screens
//return the argument(widget) if user is authenticated
MaterialPageRoute materialBuilder(
    {required Widget widget, required String route}) {
  return MaterialPageRoute(
      settings: RouteSettings(name: route),
      builder: (context) => BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return widget;
              } else {
                return const SignInScreen();
              }
            },
          ));
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
    );
  }
}
