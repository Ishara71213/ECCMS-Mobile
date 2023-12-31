import 'package:eccms/Core/Utils/functions/navigator_handler.dart';
import 'package:eccms/Core/enum/constants/constants.dart';
import 'package:eccms/Core/routes/route_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthOptionsScreen extends StatefulWidget {
  const AuthOptionsScreen({super.key});

  @override
  State<AuthOptionsScreen> createState() => _AuthOptionsScreenState();
}

class _AuthOptionsScreenState extends State<AuthOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/loginPageImage.png",
                alignment: Alignment.center,
                scale: 1,
              ),
              FilledButton(
                  onPressed: () {
                    navigationHandlerWithRemovePrevRoute(
                        context, RouteConst.signInScreen);
                  },
                  style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(60),
                      backgroundColor: kButtonPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0))),
                  child: Text("Sign In", style: kFilledButtonTextstyle)),
              const SizedBox(
                height: 16.0,
              ),
              OutlinedButton(
                  onPressed: () {
                    navigationHandlerWithRemovePrevRoute(
                        context, RouteConst.signUpScreen);
                  },
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(60),
                      side: BorderSide(color: kButtonPrimaryColor, width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0))),
                  child:
                      Text("Create Account", style: kOutlineButtonTextstyle)),
              const SizedBox(
                height: 44.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80.0,
                    height: 1.0,
                    child: Container(
                      color: kLightGreyColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(" Or continue with",
                        style: kDarkGreySmalltextStyle),
                  ),
                  SizedBox(
                    width: 80.0,
                    height: 1.0,
                    child: Container(
                      color: kLightGreyColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 38.0,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/Google__G__Logo 2.svg'),
                    const SizedBox(
                      width: 26.0,
                    ),
                    Image.asset(
                      "assets/icons/facebookIcon.png",
                      alignment: Alignment.center,
                      scale: 1,
                    ),
                    const SizedBox(
                      width: 26.0,
                    ),
                    Image.asset(
                      'assets/icons/appleIcon.png',
                      alignment: Alignment.center,
                      scale: 1,
                    )
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
