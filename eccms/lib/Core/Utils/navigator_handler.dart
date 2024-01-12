import 'package:eccms/Core/constants/user_types.dart';
import 'package:eccms/features/auth/presentation/bloc/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationHandler {
  static void navigateWithRemovePrevRoute(BuildContext context, String path) {
    String? previousRouteName =
        ModalRoute.of(context)?.settings.name.toString();
    if (previousRouteName != path) {
      Navigator.pushNamedAndRemoveUntil(context, path, (route) => false);
    }
  }

  static void navigate(BuildContext context, String path) {
    String? previousRouteName =
        ModalRoute.of(context)?.settings.name.toString();
    if (previousRouteName != path) {
      Navigator.pushNamed(context, path);
    }
  }

  static void navigateWithArgumnets(
      BuildContext context, String path, Map<String, dynamic> args) {
    String? previousRouteName =
        ModalRoute.of(context)?.settings.name.toString();
    if (previousRouteName != path) {
      Navigator.pushNamed(context, path, arguments: args);
    }
  }

  static void navigateByUserType(BuildContext context, String officerPath,
      String adminPath, String guestPath) async {
    String? previousRouteName =
        ModalRoute.of(context)?.settings.name.toString();
    String user = BlocProvider.of<UserCubit>(context).userType;

    if (user == UserTypes.officer) {
      if (previousRouteName != officerPath) {
        Navigator.pushNamedAndRemoveUntil(
            context, officerPath, (route) => false);
      }
    } else if (user == UserTypes.admin) {
      if (previousRouteName != adminPath) {
        Navigator.pushNamedAndRemoveUntil(context, adminPath, (route) => false);
      }
    } else if (user == UserTypes.guest) {
      if (previousRouteName != guestPath) {
        Navigator.pushNamedAndRemoveUntil(context, guestPath, (route) => false);
      }
    }
  }
}
