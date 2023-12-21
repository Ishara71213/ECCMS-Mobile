import 'package:eccms/Core/routes/on_generate_route.dart';
import 'package:eccms/Core/routes/route_const.dart';
import 'package:eccms/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:eccms/features/auth/presentation/bloc/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eccms/core/service_locator/injection_container.dart' as di;

// distributionUrl=https\://services.gradle.org/distributions/gradle-7.5-all.zip
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const VisionMateApp());
}

class VisionMateApp extends StatelessWidget {
  const VisionMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (_) => di.sl<AuthCubit>()..appStarted()),
        BlocProvider<UserCubit>(create: (_) => di.sl<UserCubit>()),
        // BlocProvider<UserInfoCubit>(create: (_) => di.sl<UserInfoCubit>()),
        // BlocProvider<ViuserCubit>(create: (_) => di.sl<ViuserCubit>()),
        // BlocProvider<GuardianCubit>(create: (_) => di.sl<GuardianCubit>()),
        // BlocProvider<ProfileCubit>(create: (_) => di.sl<ProfileCubit>()),
      ],
      child: const MaterialApp(
        title: 'Vision mate',
        debugShowCheckedModeBanner: false,
        initialRoute: RouteConst.splashScreen,
        onGenerateRoute: OnGenerateRoute.route,
        home: null,
      ),
    );
  }
}
