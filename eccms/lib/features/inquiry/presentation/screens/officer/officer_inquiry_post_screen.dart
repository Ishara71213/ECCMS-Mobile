import 'package:eccms/config/theme/app_themes.dart';
import 'package:eccms/features/inquiry/presentation/bloc/inquiry/cubit/inquiry_cubit.dart';
import 'package:eccms/features/inquiry/presentation/widgets/inquiry_card.dart';
import 'package:eccms/features/organization/domain/entities/city_entity.dart';
import 'package:eccms/features/organization/domain/entities/crime_type_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfficerInquiryPostScreen extends StatefulWidget {
  const OfficerInquiryPostScreen({super.key});

  @override
  State<OfficerInquiryPostScreen> createState() =>
      _OfficerInquiryPostScreenState();
}

class _OfficerInquiryPostScreenState extends State<OfficerInquiryPostScreen> {
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
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Inquiry Screen"),
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
              return Column(
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
                      child: Column(
                        children: [
                          BlocBuilder<InquiryCubit, InquiryState>(
                            builder: (context, state) {
                              return FutureBuilder(
                                  future: inquiryCubit.loadInquiries(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return GridView.builder(
                                        shrinkWrap: true,
                                        controller: scrollController,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount:
                                                    1, // number of items in each row
                                                mainAxisSpacing:
                                                    16.0, // spacing between rows
                                                crossAxisSpacing: 16.0,
                                                childAspectRatio: 3.5
                                                // spacing between columns
                                                ),
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          return InquiryCard(
                                              inquiry: snapshot.data![index]);
                                        },
                                      );
                                    } else {
                                      return SizedBox(
                                        height: size.height - 250,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          color: kPrimaryColor,
                                        )),
                                      );
                                    }
                                  });
                            },
                          )
                        ],
                      )),
                  const SizedBox(height: 100)
                ],
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
