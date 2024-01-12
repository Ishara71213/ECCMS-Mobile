import 'dart:convert';

import 'package:eccms/Core/Utils/http_helper.dart';
import 'package:eccms/Core/Utils/utility.dart';
import 'package:eccms/features/inquiry/data/data_sources/remote/inquiry/inquiry_remote_data_source.dart';
import 'package:eccms/features/inquiry/data/model/inquiry_model.dart';
import 'package:eccms/features/inquiry/domain/entities/inquiry_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InquiryRemoteDataSourceImpl extends InquiryRemoteDataSource {
  @override
  Future<List<InquiryEntity>> getAllByUserId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final String url = 'Inquiry/GetAllByUser/$id';

      final response = await HttpHelper.get(url, prefs);

      if (response.statusCode == 200) {
        final List<dynamic> inquiriesData = jsonDecode(response.body);

        List<InquiryEntity> inquiries =
            inquiriesData.map((data) => InquiryModel.fromJson(data)).toList();

        return inquiries;
      } else {
        throw Exception("Failed to fetch inquiries");
      }
    } catch (e) {
      Utility.logError(prefs, "InquiryRemoteDataSource", e.toString());
      rethrow;
    }
  }

  @override
  Future<List<InquiryEntity>> getAllByEmployeeId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final String url = 'Inquiry/GetAllByEmployeeId/$id';

      final response = await HttpHelper.get(url, prefs);

      if (response.statusCode == 200) {
        final List<dynamic> inquiriesData = jsonDecode(response.body);

        List<InquiryEntity> inquiries =
            inquiriesData.map((data) => InquiryModel.fromJson(data)).toList();

        return inquiries;
      } else {
        throw Exception("Failed to fetch inquiries");
      }
    } catch (e) {
      Utility.logError(prefs, "InquiryRemoteDataSource", e.toString());
      rethrow;
    }
  }

  @override
  Future<void> postInquiry(InquiryEntity entity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      const String url = 'Inquiry';

      InquiryModel model = InquiryModel.fromEntity(entity);

      final response = await HttpHelper.post(
          url, prefs, jsonEncode(model.toJsonPostInquiry()));

      if (response.statusCode != 200) {
        throw Exception("Failed to post inquiry");
      }
    } catch (e) {
      Utility.logError(prefs, "InquiryRemoteDataSource", e.toString());
      rethrow;
    }
  }

  @override
  Future<List<InquiryEntity>> getAllById(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final String url = 'Inquiry/GetAllById/$id';

      final response = await HttpHelper.get(url, prefs);

      if (response.statusCode == 200) {
        final List<dynamic> inquiriesData = jsonDecode(response.body);

        List<InquiryEntity> inquiries =
            inquiriesData.map((data) => InquiryModel.fromJson(data)).toList();

        return inquiries;
      } else {
        throw Exception("Failed to fetch inquiries");
      }
    } catch (e) {
      Utility.logError(prefs, "InquiryRemoteDataSource", e.toString());
      rethrow;
    }
  }
}
