import 'dart:convert';

import 'package:eccms/Core/Utils/http_helper.dart';
import 'package:eccms/Core/Utils/utility.dart';
import 'package:eccms/features/organization/data/data_sources/remote/organization_data_remote_data_source.dart';
import 'package:eccms/features/organization/data/model/branch_model.dart';
import 'package:eccms/features/organization/data/model/city_model.dart';
import 'package:eccms/features/organization/data/model/crime_type_model.dart';
import 'package:eccms/features/organization/data/model/institution_model.dart';
import 'package:eccms/features/organization/data/model/province_model.dart';
import 'package:eccms/features/organization/domain/entities/branch_entity.dart';
import 'package:eccms/features/organization/domain/entities/city_entity.dart';
import 'package:eccms/features/organization/domain/entities/crime_type_entity.dart';
import 'package:eccms/features/organization/domain/entities/institution_entity.dart';
import 'package:eccms/features/organization/domain/entities/province_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrganizationDataRemoteDataSourceImpl
    extends OrganizationDataRemoteDataSource {
  @override
  Future<List<BranchEntity>> getAllBranches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      const String url = 'Branch';

      final response = await HttpHelper.get(url, prefs);

      if (response.statusCode == 200) {
        final List<dynamic> branchesData = jsonDecode(response.body);

        List<BranchEntity> branches = branchesData
            .map<BranchEntity>((data) => BranchModel.fromJson(data))
            .toList();

        return branches;
      } else {
        throw Exception("Failed to fetch branches");
      }
    } catch (e) {
      Utility.logError(prefs, "OrganizationData", e.toString());
      rethrow;
    }
  }

  @override
  Future<List<BranchEntity>> getAllBranchesByInstitutionId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final String url = 'Branch/GetAllByInstitution/$id';

      final response = await HttpHelper.get(url, prefs);

      if (response.statusCode == 200) {
        final List<dynamic> branchesData = jsonDecode(response.body);

        List<BranchEntity> branches = branchesData
            .map<BranchEntity>((data) => BranchModel.fromJson(data))
            .toList();

        return branches;
      } else {
        throw Exception("Failed to fetch branches by institution id");
      }
    } catch (e) {
      Utility.logError(prefs, "OrganizationData", e.toString());
      rethrow;
    }
  }

  @override
  Future<void> postBranch(BranchEntity entity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      const String url = 'Branch';

      BranchModel model = BranchModel(
        id: entity.id,
        name: entity.name,
        address: entity.address,
        phoneNumber: entity.phoneNumber,
        emailAddress: entity.emailAddress,
        cityId: entity.cityId,
        institutionId: entity.institutionId,
      );

      var payload = model.toJson();
      final response = await HttpHelper.post(url, prefs, jsonEncode(payload));

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception("Failed to post branch");
      }
    } catch (e) {
      Utility.logError(prefs, "OrganizationData", e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CityEntity>> getAllCities() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      const String url = 'City';

      final response = await HttpHelper.get(url, prefs);

      if (response.statusCode == 200) {
        final List<dynamic> citiesData = jsonDecode(response.body);

        List<CityEntity> cities = citiesData.map<CityEntity>((data) {
          CityModel model = CityModel.fromJson(data);
          return CityEntity(
            id: model.id,
            name: model.name,
            provinceId: model.provinceId,
          );
        }).toList();

        return cities;
      } else {
        throw Exception("Failed to fetch cities");
      }
    } catch (e) {
      Utility.logError(prefs, "OrganizationData", e.toString());
      rethrow;
    }
  }

  @override
  Future<void> postCity(CityEntity entity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      const String url = 'City';

      CityModel model = CityModel.fromEntity(entity);

      final response =
          await HttpHelper.post(url, prefs, jsonEncode(model.toJson()));

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception("Failed to post city");
      }
    } catch (e) {
      Utility.logError(prefs, "OrganizationData", e.toString());
      rethrow;
    }
  }

  @override
  Future<List<InstitutionEntity>> getAllInstitutions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      const String url = 'Institution';

      final response = await HttpHelper.get(url, prefs);

      if (response.statusCode == 200) {
        final List<dynamic> institutionsData = jsonDecode(response.body);

        List<InstitutionEntity> institutions = institutionsData
            .map((data) => InstitutionModel.fromJson(data))
            .toList();

        return institutions;
      } else {
        throw Exception("Failed to fetch institutions");
      }
    } catch (e) {
      Utility.logError(prefs, "OrganizationData", e.toString());
      rethrow;
    }
  }

  @override
  Future<InstitutionEntity> getInstitutionById(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final String url = 'Institution/$id';

      final response = await HttpHelper.get(url, prefs);

      if (response.statusCode == 200) {
        final dynamic institutionData = jsonDecode(response.body);

        InstitutionEntity institution =
            InstitutionModel.fromJson(institutionData);

        return institution;
      } else {
        throw Exception("Failed to fetch institution");
      }
    } catch (e) {
      Utility.logError(prefs, "OrganizationData", e.toString());
      rethrow;
    }
  }

  @override
  Future<List<ProvinceEntity>> getAllProvinces() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      const String url = 'Province';

      final response = await HttpHelper.get(url, prefs);

      if (response.statusCode == 200) {
        final List<dynamic> provincesData = jsonDecode(response.body);

        List<ProvinceEntity> provinces = provincesData
            .map<ProvinceEntity>((data) => ProvinceModel.fromJson(data))
            .toList();
        return provinces;
      } else {
        throw Exception("Failed to fetch provinces");
      }
    } catch (e) {
      Utility.logError(prefs, "OrganizationData", e.toString());
      rethrow;
    }
  }

  @override
  Future<void> postProvince(ProvinceEntity entity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      const String url = 'Province';

      ProvinceModel model = ProvinceModel.fromEntity(entity);

      final response =
          await HttpHelper.post(url, prefs, jsonEncode(model.toJson()));

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception("Failed to post province");
      }
    } catch (e) {
      Utility.logError(prefs, "OrganizationData", e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CrimeTypeEntity>> getAllCrimeType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      const String url = 'CrimeType';

      final response = await HttpHelper.get(url, prefs);

      if (response.statusCode == 200) {
        final List<dynamic> crimeTypesData = jsonDecode(response.body);

        List<CrimeTypeEntity> crimeTypes = crimeTypesData
            .map<CrimeTypeEntity>((data) => CrimeTypeModel.fromJson(data))
            .toList();

        return crimeTypes;
      } else {
        throw Exception("Failed to fetch crime types");
      }
    } catch (e) {
      Utility.logError(prefs, "OrganizationData", e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CrimeTypeEntity>> getAllCrimeTypeByInstitutionId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final String url = 'CrimeType/GetAllByInstitution/$id';

      final response = await HttpHelper.get(url, prefs);

      if (response.statusCode == 200) {
        final List<dynamic> crimeTypesData = jsonDecode(response.body);

        List<CrimeTypeEntity> crimeTypes = crimeTypesData
            .map<CrimeTypeEntity>((data) => CrimeTypeModel.fromJson(data))
            .toList();

        return crimeTypes;
      } else {
        throw Exception("Failed to fetch crime types by institution id");
      }
    } catch (e) {
      Utility.logError(prefs, "OrganizationData", e.toString());
      rethrow;
    }
  }

  @override
  Future<void> postCrimeType(CrimeTypeEntity entity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      const String url = 'CrimeType';

      CrimeTypeModel model = CrimeTypeModel.fromEntity(entity);

      final response =
          await HttpHelper.post(url, prefs, jsonEncode(model.toJson()));

      if (response.statusCode == 200) {
        // Successful post
      } else {
        throw Exception("Failed to post crime type");
      }
    } catch (e) {
      Utility.logError(prefs, "OrganizationData", e.toString());
      rethrow;
    }
  }
}
