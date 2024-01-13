import 'dart:convert';

import 'package:eccms/config/theme/app_themes.dart';
import 'package:eccms/features/inquiry/domain/entities/inquiry_entity.dart';
import 'package:eccms/features/inquiry/presentation/bloc/inquiry/cubit/inquiry_cubit.dart';
import 'package:eccms/features/organization/domain/entities/branch_entity.dart';
import 'package:eccms/features/organization/domain/entities/crime_type_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InquirySinglePostScreen extends StatefulWidget {
  final InquiryEntity inquiryEntity;
  final BranchEntity branchEntity;
  final CrimeTypeEntity crimetype;
  const InquirySinglePostScreen({
    super.key,
    required this.inquiryEntity,
    required this.branchEntity,
    required this.crimetype,
  });

  @override
  State<InquirySinglePostScreen> createState() =>
      _InquirySinglePostScreenState();
}

class _InquirySinglePostScreenState extends State<InquirySinglePostScreen> {
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Inquiry"),
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
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              topCard(),
              const SizedBox(height: 20),
              if (widget.inquiryEntity.reviewingResponse != null)
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 20),
                  child: reviewingresponseCard(),
                ),
              if (widget.inquiryEntity.assignResponse != null)
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 20),
                  child: assigningresponseCard(),
                ),
              if (widget.inquiryEntity.investigatingResponse != null)
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 20),
                  child: investigatingResponseCard(),
                ),
              if (widget.inquiryEntity.completeResponse != null)
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 20),
                  child: completeresponseCard(),
                ),
            ],
          ),
        )),
      ),
    );
  }

  Widget topCard() {
    return Container(
      color: kAppBgLightestShade,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Text(
                "${widget.inquiryEntity.ticketId}",
                style: kContactTextStyle,
              )),
              Flexible(
                  child: Text(
                widget.crimetype.name,
                style: kInputFieldLabelLighterText,
              )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                  child: Text(
                "${widget.inquiryEntity.inquiryEntry}",
                style: kContactTextStyle,
              )),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Flexible(
                  child: Text(
                widget.crimetype.description,
                style: kInputFieldLabelLighterText,
              )),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              SizedBox(
                  height: 200,
                  child: buildImage(widget.inquiryEntity.userAttachment))
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Flexible(
                  child: Text(
                "${widget.branchEntity.name}  | ${widget.branchEntity.phoneNumber}",
                style: kInputFieldLabelLighterText,
              )),
            ],
          ),
          Row(
            children: [
              Flexible(
                  child: Text(
                widget.branchEntity.emailAddress,
                style: kInputFieldLabelLighterText,
              )),
            ],
          )
        ],
      ),
    );
  }

  Widget reviewingresponseCard() {
    return Container(
      color: kAppBgLightestShade,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                  child: Text(
                "${widget.inquiryEntity.reviewingResponse}",
                style: kContactTextStyle,
              )),
            ],
          ),
        ],
      ),
    );
  }

  Widget assigningresponseCard() {
    return Container(
      color: kAppBgLightestShade,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                  child: Text(
                "${widget.inquiryEntity.reviewingResponse}",
                style: kContactTextStyle,
              )),
            ],
          ),
        ],
      ),
    );
  }

  Widget investigatingResponseCard() {
    return Container(
      color: kAppBgLightestShade,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                  child: Text(
                "${widget.inquiryEntity.investigatingResponse}",
                style: kContactTextStyle,
              )),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                  height: 200,
                  child: buildImage(widget.inquiryEntity.userAttachment))
            ],
          ),
        ],
      ),
    );
  }

  Widget completeresponseCard() {
    return Container(
      color: kAppBgLightestShade,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                  child: Text(
                "${widget.inquiryEntity.completeResponse}",
                style: kContactTextStyle,
              )),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImage(String? base64String) {
    late Image userAttachment;
    if (widget.inquiryEntity.userAttachment != "") {
      String base64Image = widget.inquiryEntity.userAttachment!.split(',').last;
      Uint8List bytes = base64.decode(base64Image);
      userAttachment = Image.memory(bytes);
    }
    return base64String != ""
        ? userAttachment
        : Image.asset(
            'assets/images/image_placeholder.png',
            height: 200,
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
}
