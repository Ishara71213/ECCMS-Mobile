import 'package:eccms/Core/Utils/functions/navigator_handler.dart';
import 'package:eccms/Core/common/entities/user_entity.dart';
import 'package:eccms/Core/enum/constants/constants.dart';
import 'package:eccms/Core/enum/constants/user_types.dart';
import 'package:eccms/Core/enum/states.dart';
import 'package:eccms/Core/routes/route_const.dart';
import 'package:eccms/Core/widgets/button_widgets/button_widgets_library.dart';
import 'package:eccms/Core/widgets/input_widgets/input_widgets_library.dart';
import 'package:eccms/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:eccms/features/auth/presentation/bloc/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  final TextEditingController _userFirstNameController =
      TextEditingController();
  final TextEditingController _userLastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  String? purposeOfUserSelectedVal;

  final List<Map<String, dynamic>> purposeOfUserList = [
    {"text": "Officer", "value": UserTypes.officer},
    {"text": "Admin", "value": UserTypes.admin},
    {"text": "guest", "value": UserTypes.guest}
  ];

  @override
  void dispose() {
    _userFirstNameController.dispose();
    _userLastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) async {
          if (state is UserSuccess) {
            await Future.delayed(const Duration(seconds: 1), () {
              BlocProvider.of<AuthCubit>(context).appStarted();
            });
          }
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 30.0, bottom: 0.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Form(
                        key: formKeySignUp,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child:
                                  Text("Create Account", style: kTitleOneText),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: TextFormInput(
                                  fieldName: "First Name",
                                  controller: _userFirstNameController,
                                  hintText: "First Name",
                                  prefixIcon: const Icon(Icons.verified_user),
                                )),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: TextFormInput(
                                  fieldName: "Last Name",
                                  controller: _userLastNameController,
                                  hintText: "Last Name",
                                  prefixIcon: const Icon(Icons.verified_user),
                                )),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: TextFormInput(
                                  fieldName: "Email",
                                  hintText: "Email",
                                  controller: _emailController,
                                  prefixIcon: const Icon(Icons.email),
                                )),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: TextFormInput(
                                  fieldName: "Password",
                                  hintText: "Password",
                                  controller: _passwordController,
                                  prefixIcon: const Icon(Icons.lock),
                                )),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: DateSelectorInput(
                                  fieldName: "Date of Birth",
                                  hintText: "Date of Birthday",
                                  controller: _dateOfBirthController,
                                  prefixIcon: const Icon(Icons.calendar_month),
                                )),
                            Padding(
                              //Purpose of user
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: DropdownFromListInput(
                                fieldName: "Purpose of user",
                                list: purposeOfUserList,
                                selectedValue: purposeOfUserSelectedVal,
                                onChange: (value) => setState(() {
                                  purposeOfUserSelectedVal = value!.toString();
                                }),
                                hintText: "Purpose of user",
                                prefixIcon: const Icon(Icons.sms),
                                isMandotary: true,
                              ),
                            ),
                            BlocBuilder<UserCubit, UserState>(
                              builder: (context, state) {
                                return FilledButtonWithLoader(
                                    initText: 'Sign Up',
                                    loadingText: 'Creating Account',
                                    successText: 'Account Created',
                                    onPressed: () {
                                      if (formKeySignUp.currentState!
                                          .validate()) {
                                        submitSignUp(context);
                                      }
                                    },
                                    state: (state is UserLoading)
                                        ? States.loading
                                        : (state is UserSuccess)
                                            ? States.success
                                            : States.initial);
                              },
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 40.0,
                      child: BlocBuilder<UserCubit, UserState>(
                        builder: (context, state) {
                          return (state is UserFailrue)
                              ? Column(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        BlocProvider.of<UserCubit>(context)
                                            .errorMsg,
                                        style: kwarningText,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
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
                          SvgPicture.asset(
                              'assets/icons/Google__G__Logo 2.svg'),
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
                        ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?",
                              style: kBlackSmalltextStyle),
                          const SizedBox(width: 4.0),
                          TextButton(
                              onPressed: () {
                                navigationHandlerWithRemovePrevRoute(
                                    context, RouteConst.signInScreen);
                              },
                              child: Text(
                                "Sign In",
                                style: kBlueSmalltextStyle,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void submitSignUp(context) async {
    await BlocProvider.of<UserCubit>(context).submitSignUp(
        user: UserEntity(
            firstName: _userFirstNameController.text,
            lastName: _userLastNameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            dob: _dateOfBirthController.text,
            userType: purposeOfUserSelectedVal));
  }
}
