import 'dart:io';

import 'package:eccms/Core/widgets/input_widgets/input_widgets_library.dart';
import 'package:eccms/config/theme/app_themes.dart';
import 'package:eccms/features/inquiry/presentation/bloc/inquiry/cubit/inquiry_cubit.dart';
import 'package:eccms/features/organization/domain/entities/city_entity.dart';
import 'package:eccms/features/organization/domain/entities/crime_type_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class InquiryScreen extends StatefulWidget {
  const InquiryScreen({super.key});

  @override
  State<InquiryScreen> createState() => _InquiryScreenState();
}

class _InquiryScreenState extends State<InquiryScreen> {
  final TextEditingController _inquiryController = TextEditingController();

  late InquiryCubit inquiryCubit;

  int cityId = 1;
  int crimeTypeId = 1;
  @override
  void initState() {
    super.initState();
    loadDate();
  }

  void loadDate() async {
    inquiryCubit = BlocProvider.of<InquiryCubit>(context);
    await inquiryCubit.init();

    cityId = inquiryCubit.cityList.first.id;
    crimeTypeId = inquiryCubit.crimeTypeList.first.id;
  }

  @override
  Widget build(BuildContext context) {
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
        ),
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SingleChildScrollView(
          child: BlocBuilder<InquiryCubit, InquiryState>(
            builder: (context, state) {
              return state is! InquiryInitialDataLoading
                  ? Column(
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
                                buildCrimeTypeDropdown(
                                    inquiryCubit.crimeTypeList),
                                const SizedBox(height: 10),
                                buildCityDropdown(inquiryCubit.cityList),
                                const SizedBox(height: 10),
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
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image.file(
                                                  File(inquiryCubit
                                                      .imageFile!.path),
                                                  width: 100.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 70),
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() => inquiryCubit
                                                      .imageFile = null);
                                                },
                                                icon: Icon(
                                                  Icons.close,
                                                  color: kPrimaryColor,
                                                ),
                                                style: IconButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xfff2dfe1)
                                                          .withOpacity(0.7),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
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
                                            inquiryCubit
                                                .getFromGallery(context);
                                          },
                                          style: OutlinedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            side: BorderSide(
                                              width: 1.2,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                        onPressed: () => inquiryCubit.onSubmit(
                                            context,
                                            _inquiryController.text,
                                            crimeTypeId,
                                            cityId),
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 28.0),
                                          backgroundColor: kPrimaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            BlocBuilder<InquiryCubit,
                                                InquiryState>(
                                              builder: (context, state) {
                                                if (state
                                                    is InquirySubmitting) {
                                                  return Row(
                                                    children: [
                                                      Text(
                                                        "Submitting",
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 16,
                                                        width: 16,
                                                        margin: const EdgeInsets
                                                            .only(left: 10),
                                                        child:
                                                            CircularProgressIndicator(
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
                                                      fontWeight:
                                                          FontWeight.w500,
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
                    )
                  : SizedBox(
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }

  Widget buildCrimeTypeDropdown(crimetype) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Crime Type"),
        DropdownButton<String>(
          isExpanded: true,
          value: crimetype.isNotEmpty ? crimeTypeId.toString() : "Select City",
          onChanged: (String? newValue) {
            setState(() {
              crimeTypeId = int.parse(newValue ?? "0");
            });
          },
          items:
              crimetype.map<DropdownMenuItem<String>>((CrimeTypeEntity entity) {
            return DropdownMenuItem<String>(
              value: entity.id.toString(),
              child: Text(entity.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget buildCityDropdown(cities) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("City"),
        DropdownButton<String>(
          isExpanded: true,
          value: cities.isNotEmpty ? cityId.toString() : "Select City",
          onChanged: (String? newValue) {
            setState(() {
              cityId = int.parse(newValue ?? "0");
            });
          },
          items: cities.map<DropdownMenuItem<String>>((CityEntity city) {
            return DropdownMenuItem<String>(
              value: city.id.toString(),
              child: Text(city.name),
            );
          }).toList(),
        ),
      ],
    );
  }
}
