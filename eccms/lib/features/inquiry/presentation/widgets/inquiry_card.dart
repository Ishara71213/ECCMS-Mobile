import 'package:eccms/config/theme/app_themes.dart';
import 'package:eccms/features/inquiry/domain/entities/inquiry_entity.dart';
import 'package:eccms/features/inquiry/presentation/bloc/inquiry/cubit/inquiry_cubit.dart';
import 'package:eccms/features/inquiry/presentation/screens/inquiry_single_post_screen.dart';
import 'package:eccms/features/organization/domain/entities/branch_entity.dart';
import 'package:eccms/features/organization/domain/entities/crime_type_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InquiryCard extends StatelessWidget {
  final InquiryEntity inquiry;
  const InquiryCard({super.key, required this.inquiry});

  @override
  Widget build(BuildContext context) {
    InquiryCubit inquiryCubit = BlocProvider.of<InquiryCubit>(context);
    CrimeTypeEntity crimeType = inquiryCubit.crimeTypeList
        .where((e) => e.id == inquiry.crimeTypeId)
        .first;
    BranchEntity branch =
        inquiryCubit.branchList.where((e) => e.id == inquiry.branchId).first;
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InquirySinglePostScreen(
                      inquiryEntity: inquiry,
                      branchEntity: branch,
                      crimetype: crimeType,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            color: kAppBgLightestShade, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${inquiry.inquiryEntry}",
                        style: kContactTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width / 2,
                        child: Text(
                          crimeType.name,
                          style: kInputFieldLabelLighterText,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Avg time ${crimeType.averageResponseHours}",
                        style: kInputFieldLabelLighterText,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        branch.name,
                        style: kInputFieldLabelLighterText,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
