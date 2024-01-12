import 'dart:io';

import 'package:eccms/Core/Utils/navigator_handler.dart';
import 'package:eccms/Core/widgets/input_widgets/input_widgets_library.dart';
import 'package:eccms/config/routes/route_const.dart';
import 'package:eccms/config/theme/app_themes.dart';
import 'package:eccms/features/inquiry/presentation/bloc/inquiry/cubit/inquiry_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class InquiryPostScreen extends StatefulWidget {
  const InquiryPostScreen({super.key});

  @override
  State<InquiryPostScreen> createState() => _InquiryPostScreenState();
}

class _InquiryPostScreenState extends State<InquiryPostScreen> {
  final TextEditingController _inquiryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    InquiryCubit inquiryCubit = BlocProvider.of<InquiryCubit>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          centerTitle: true,
          elevation: 0,
          leadingWidth: 70,
          foregroundColor: kPrimaryColor,
          backgroundColor: kAppBgColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: IconButton(
                  onPressed: () {
                    NavigationHandler.navigate(
                        context, RouteConst.inquiryPostScreen);
                  },
                  icon: Icon(
                    Icons.add_circle_rounded,
                    size: 40,
                    color: kPrimaryColor,
                  )),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFormInput(
                        controller: _inquiryController,
                        isTextArea: true,
                        fieldName: "Inquiry",
                        hintText: "Inquiry",
                        isMandotary: true,
                      ),
                      BlocBuilder<InquiryCubit, InquiryState>(
                          builder: (context, state) {
                        if (state is InquirymediaUploadSuccess &&
                            inquiryCubit.imageFile != null) {
                          return Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.file(
                                        File(inquiryCubit.imageFile!.path),
                                        width: 100.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 70),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() =>
                                            inquiryCubit.imageFile = null);
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: kPrimaryColor,
                                      ),
                                      style: IconButton.styleFrom(
                                        backgroundColor: const Color(0xfff2dfe1)
                                            .withOpacity(0.7),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
                      Container(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  inquiryCubit.getFromGallery(context);
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  side: BorderSide(
                                    width: 1.2,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.upload_file,
                                      color: kPrimaryColor,
                                    ),
                                    const SizedBox(
                                      width: 6.0,
                                    ),
                                    Text(
                                      "Upload",
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  inquiryCubit.getFromCamera(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  backgroundColor: kPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera_alt,
                                      color: kAppBgColor,
                                    ),
                                    const SizedBox(
                                      width: 6.0,
                                    ),
                                    Text(
                                      'Take a Picture',
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14.0),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => inquiryCubit.onSubmit(context),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0),
                                backgroundColor: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BlocBuilder<InquiryCubit, InquiryState>(
                                    builder: (context, state) {
                                      if (state is InquirySubmitting) {
                                        return Row(
                                          children: [
                                            Text(
                                              "Submitting",
                                              style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              height: 16,
                                              width: 16,
                                              margin: const EdgeInsets.only(
                                                  left: 10),
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                            Color>(
                                                        kAppBgLightestShade),
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Text(
                                          "Submit",
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        );
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
