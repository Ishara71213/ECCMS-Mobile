import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:eccms/Core/Utils/http_helper.dart';
import 'package:eccms/Core/Utils/utility.dart';
import 'package:eccms/features/auth/domain/usecases/get_current_uid_usecase.dart';
import 'package:eccms/features/inquiry/domain/entities/inquiry_entity.dart';
import 'package:eccms/features/inquiry/domain/usecases/inquiry/get_all_by_employee_id.dart';
import 'package:eccms/features/inquiry/domain/usecases/inquiry/get_all_by_user_id.dart';
import 'package:eccms/features/inquiry/domain/usecases/inquiry/post_inquiry.dart';
import 'package:eccms/features/organization/domain/entities/branch_entity.dart';
import 'package:eccms/features/organization/domain/entities/city_entity.dart';
import 'package:eccms/features/organization/domain/entities/crime_type_entity.dart';
import 'package:eccms/features/organization/domain/usecases/branch/get_all_branches.dart';
import 'package:eccms/features/organization/domain/usecases/branch/post_branch.dart';
import 'package:eccms/features/organization/domain/usecases/cities/get_all_cities.dart';
import 'package:eccms/features/organization/domain/usecases/cities/post_city.dart';
import 'package:eccms/features/organization/domain/usecases/crime_type/get_all_crime_type.dart';
import 'package:eccms/features/organization/domain/usecases/crime_type/get_all_crime_type_by_institution_id.dart';
import 'package:eccms/features/organization/domain/usecases/crime_type/post_crime_type.dart';
import 'package:eccms/features/organization/domain/usecases/institutions/get_all_institutions.dart';
import 'package:eccms/features/organization/domain/usecases/province/get_all_provinces.dart';
import 'package:eccms/features/organization/domain/usecases/province/post_province.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'inquiry_state.dart';

class InquiryCubit extends Cubit<InquiryState> {
  final GetAllByUserIdUsecase getAllByUserIdUsecase;
  final GetAllByEmployeeIdUsecase getAllByEmployeeIdUsecase;
  final PostInquiryUsecase postInquiryUsecase;
  final GetAllBranchesUsecase getAllBranchesUsecase;
  final GetAllCitiesUsecase getAllCitiesUsecase;
  final GetAllCrimeTypeUsecase getAllCrimeTypesUsecase;
  final GetAllCrimeTypeByInstitutionIdUsecase
      getAllCrimeTypesByInstitutionIdUsecase;
  final GetAllInstitutionsUsecase getAllInstitutionsUsecase;
  final GetAllProvincesUsecase getAllProvincesUsecase;
  final PostBranchUsecase postBranchUsecase;
  final PostCityUsecase postCityUsecase;
  final PostCrimeTypeUsecase postCrimeTypeUsecase;
  final PostProvinceUsecase postProvinceUsecase;
  final GetCurrentUIdUsecase getCurrentUIdUsecase;

  InquiryCubit({
    required this.getAllByUserIdUsecase,
    required this.getAllByEmployeeIdUsecase,
    required this.postInquiryUsecase,
    required this.getAllBranchesUsecase,
    required this.getAllCitiesUsecase,
    required this.getAllCrimeTypesUsecase,
    required this.getAllCrimeTypesByInstitutionIdUsecase,
    required this.getAllInstitutionsUsecase,
    required this.getAllProvincesUsecase,
    required this.postBranchUsecase,
    required this.postCityUsecase,
    required this.postCrimeTypeUsecase,
    required this.postProvinceUsecase,
    required this.getCurrentUIdUsecase,
  }) : super(InquiryInitial());

  File? imageFile;
  XFile? imageFileCompressed;
  String profileImageUrl = "";
  List<BranchEntity> branchList = [];
  List<CityEntity> cityList = [];
  List<CrimeTypeEntity> crimeTypeList = [];
  String attachment = "";

  Future<void> init() async {
    emit(InquiryInitialDataLoading());
    cityList = await getAllCitiesUsecase.call();
    branchList = await getAllBranchesUsecase.call();
    crimeTypeList = await getAllCrimeTypesUsecase.call();
    emit(InquiryInitial());
  }

  Future<XFile?> compressFile(File file) async {
    final filePath = file.absolute.path;
    final fileExtension = filePath.split('.').last.toLowerCase();
    final lastIndex = filePath.lastIndexOf('.');
    final splitted = filePath.substring(0, lastIndex);
    final outPath = "$splitted\\_out.$fileExtension";
    dynamic result;

    if (fileExtension == 'jpg' || fileExtension == 'jpeg') {
      result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        outPath,
        quality: 20,
      );
    } else if (fileExtension == 'png') {
      // Compress PNG images
      result = await FlutterImageCompress.compressAndGetFile(filePath, outPath,
          quality: 20, format: CompressFormat.png);
    } else if (fileExtension == 'heic') {
      result = await FlutterImageCompress.compressAndGetFile(filePath, outPath,
          quality: 20, format: CompressFormat.heic);
    } else if (fileExtension == 'webp') {
      result = await FlutterImageCompress.compressAndGetFile(filePath, outPath,
          quality: 20, format: CompressFormat.webp);
    } else {
      return XFile(file.path);
    }
    return result;
  }

  void getFromCamera(BuildContext context) async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        File hqFile = File(pickedFile.path);
        XFile? compressedFile = await compressFile(hqFile);

        imageFile = File(compressedFile!.path);
        emit(InquirymediaUploadSuccess());
        //imageFileCompressed = compressedFile;
      } else {
        return;
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Image capture error')));
    }
  }

  void getFromGallery(BuildContext context) async {
    var status = await Permission.storage.request();

    try {
      if (status.isGranted) {
        final pickedFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);

        if (pickedFile != null) {
          File hqFile = File(pickedFile.path);
          XFile? compressedFile = await compressFile(hqFile);
          imageFile = File(compressedFile!.path);
          // final originalLength = await hqFile.length();
          // final compressedSize = await imageFile!.length();
        } else {
          return;
        }
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Permission denied')));
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      Utility.error(context, "Image Selecting error");
    }
  }

  void onSubmit(BuildContext context, String inquiryEntry, int crimeTypeId,
      int cityId) async {
    try {
      if (imageFile != null) {
        attachment = base64Encode(
          Uint8List.fromList(await imageFile!.readAsBytes()),
        );
      }
      BranchEntity selectedBranch =
          branchList.where((element) => element.cityId == cityId).first;
      int userId = await getCurrentUIdUsecase.call();
      InquiryEntity entity = InquiryEntity(
          userId: userId,
          branchId: selectedBranch.id,
          institutionId: selectedBranch.institutionId,
          crimeTypeId: crimeTypeId,
          status: 0,
          inquiryEntry: inquiryEntry,
          userAttachment: attachment);
      await postInquiryUsecase.call(entity);
      // ignore: use_build_context_synchronously
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      Utility.success(context, "Your Inquiry Submited Successfully");
    } catch (e) {
      // ignore: use_build_context_synchronously
      Utility.error(context, "Image Selecting error");
    }
  }

  Future<List<InquiryEntity>> loadInquiries(context) async {
    List<InquiryEntity> result = [];
    try {
      int userId = await getCurrentUIdUsecase.call();
      result = await getAllByUserIdUsecase.call(userId);
    } catch (e) {
      Utility.error(context, "Inquiries loading error");
    }
    return result;
  }

  Future<List<InquiryEntity>> loadInquiriesByEmployeeId(context) async {
    List<InquiryEntity> result = [];
    try {
      int userId = await getCurrentUIdUsecase.call();
      result = await getAllByEmployeeIdUsecase.call(userId);
    } catch (e) {
      Utility.error(context, "Inquiries loading error");
    }
    return result;
  }

  Future<void> inquaryResponseReply(BuildContext context, int id, int status,
      String attachment, String reply) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      const String url = 'InquiryResponse/Reply';

      var payload = <String, dynamic>{
        "id": id,
        "status": status,
        "attachment": attachment,
        "response": reply
      };

      final response = await HttpHelper.put(url, prefs, jsonEncode(payload));

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception("Failed to post inquiry");
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      Utility.error(context, "Inquiries loading error");
      Utility.logError(prefs, "InquiryRemoteDataSource", e.toString());
      rethrow;
    }
  }
}
