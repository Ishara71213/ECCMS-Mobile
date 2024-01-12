import 'package:eccms/features/app_features/domain/usecases/get_email_by_uid.dart';
import 'package:eccms/features/auth/data/data_sources/remote/auth_eccms_remote_data_source.dart';
import 'package:eccms/features/auth/data/data_sources/remote/auth_ecms_remote_data_source_impl.dart';
import 'package:eccms/features/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:eccms/features/auth/domain/repository/Auth_repository.dart';
import 'package:eccms/features/auth/domain/usecases/get_current_uid_usecase.dart';
import 'package:eccms/features/auth/domain/usecases/get_current_user_by_uid_usecase.dart';
import 'package:eccms/features/auth/domain/usecases/is_sign_in_usecase.dart';
import 'package:eccms/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:eccms/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:eccms/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:eccms/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:eccms/features/auth/presentation/bloc/user/cubit/user_cubit.dart';
import 'package:eccms/features/inquiry/data/data_sources/remote/inquiry/inquiry_remote_data_source.dart';
import 'package:eccms/features/inquiry/data/data_sources/remote/inquiry/inquiry_remote_data_source_impl.dart';
import 'package:eccms/features/inquiry/data/repository_impl/inquiry_repository_impl.dart';
import 'package:eccms/features/inquiry/domain/repository/inquiry_repository.dart';
import 'package:eccms/features/inquiry/domain/usecases/inquiry/get_all_by_employee_id.dart';
import 'package:eccms/features/inquiry/domain/usecases/inquiry/get_all_by_id.dart';
import 'package:eccms/features/inquiry/domain/usecases/inquiry/get_all_by_user_id.dart';
import 'package:eccms/features/inquiry/domain/usecases/inquiry/post_inquiry.dart';
import 'package:eccms/features/inquiry/presentation/bloc/inquiry/cubit/inquiry_cubit.dart';
import 'package:eccms/features/organization/data/data_sources/remote/organization_data_remote_data_source.dart';
import 'package:eccms/features/organization/data/data_sources/remote/organization_data_remote_data_source_impl.dart';
import 'package:eccms/features/organization/data/repository_impl/branches_repository_impl.dart';
import 'package:eccms/features/organization/data/repository_impl/cities_repository_impl.dart';
import 'package:eccms/features/organization/data/repository_impl/crime_type_repository_impl.dart';
import 'package:eccms/features/organization/data/repository_impl/institution_repository_impl.dart';
import 'package:eccms/features/organization/data/repository_impl/province_repository_impl.dart';
import 'package:eccms/features/organization/domain/repository/branch_repository.dart';
import 'package:eccms/features/organization/domain/repository/city_repository.dart';
import 'package:eccms/features/organization/domain/repository/crime_type_repository.dart';
import 'package:eccms/features/organization/domain/repository/institutions_repository.dart';
import 'package:eccms/features/organization/domain/repository/provinces_repository.dart';
import 'package:eccms/features/organization/domain/usecases/branch/get_all_branches.dart';
import 'package:eccms/features/organization/domain/usecases/branch/get_all_branches_by_institution_id.dart';
import 'package:eccms/features/organization/domain/usecases/branch/post_branch.dart';
import 'package:eccms/features/organization/domain/usecases/cities/get_all_cities.dart';
import 'package:eccms/features/organization/domain/usecases/cities/post_city.dart';
import 'package:eccms/features/organization/domain/usecases/crime_type/get_all_crime_type.dart';
import 'package:eccms/features/organization/domain/usecases/crime_type/get_all_crime_type_by_institution_id.dart';
import 'package:eccms/features/organization/domain/usecases/crime_type/post_crime_type.dart';
import 'package:eccms/features/organization/domain/usecases/institutions/get_all_institutions.dart';
import 'package:eccms/features/organization/domain/usecases/institutions/get_institution_by_id.dart';
import 'package:eccms/features/organization/domain/usecases/province/get_all_provinces.dart';
import 'package:eccms/features/organization/domain/usecases/province/post_province.dart';

import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //Bloc/cubit
  sl.registerFactory<AuthCubit>(() => AuthCubit(
      getCurrentUIdUsecase: sl.call(),
      isSignInUsecase: sl.call(),
      signOutUsecase: sl.call()));

  sl.registerFactory<UserCubit>(() => UserCubit(
      signInUsecase: sl.call(),
      signUpUsecase: sl.call(),
      getCurrentUIdUsecase: sl.call(),
      getCurrentUserByUidUsecase: sl.call()));

  sl.registerFactory<InquiryCubit>(() => InquiryCubit(
        getAllByUserIdUsecase: sl.call(),
        getAllByEmployeeIdUsecase: sl.call(),
        postInquiryUsecase: sl.call(),
        getAllCrimeTypesByInstitutionIdUsecase: sl.call(),
        getAllInstitutionsUsecase: sl.call(),
        // getAllProvincesUsecase: sl.call(),
        // postBranchUsecase: sl.call(),
        // postCityUsecase: sl.call(),
        postCrimeTypeUsecase: sl.call(),
        // postProvinceUsecase: sl.call(),
        getCurrentUIdUsecase: sl.call(),
        getAllCrimeTypesUsecase: sl.call(),
      ));

  //usecase

  //--auth usecases
  sl.registerLazySingleton<SignInUsecase>(
      () => SignInUsecase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUsecase>(
      () => SignOutUsecase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUsecase>(
      () => SignUpUsecase(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUsecase>(
      () => IsSignInUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUIdUsecase>(
      () => GetCurrentUIdUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUserByUidUsecase>(
      () => GetCurrentUserByUidUsecase(repository: sl.call()));

  //App features usecases
  sl.registerLazySingleton<GetEmailByUidUsecase>(
      () => GetEmailByUidUsecase(repository: sl.call()));

  //Organization usecases

// For Branches Module
  sl.registerLazySingleton<GetAllBranchesUsecase>(
      () => GetAllBranchesUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetAllBranchesByInstitutionIdUsecase>(
      () => GetAllBranchesByInstitutionIdUsecase(repository: sl.call()));
  sl.registerLazySingleton<PostBranchUsecase>(
      () => PostBranchUsecase(repository: sl.call()));

// For Cities Module
  sl.registerLazySingleton<GetAllCitiesUsecase>(
      () => GetAllCitiesUsecase(repository: sl.call()));
  sl.registerLazySingleton<PostCityUsecase>(
      () => PostCityUsecase(repository: sl.call()));

// For Crime Types Module
  sl.registerLazySingleton<GetAllCrimeTypeUsecase>(
      () => GetAllCrimeTypeUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetAllCrimeTypeByInstitutionIdUsecase>(
      () => GetAllCrimeTypeByInstitutionIdUsecase(repository: sl.call()));
  sl.registerLazySingleton<PostCrimeTypeUsecase>(
      () => PostCrimeTypeUsecase(repository: sl.call()));

// For Institutions Module
  sl.registerLazySingleton<GetAllInstitutionsUsecase>(
      () => GetAllInstitutionsUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetInstitutionByIdUsecase>(
      () => GetInstitutionByIdUsecase(repository: sl.call()));

// For Provinces Module
  sl.registerLazySingleton<GetAllProvincesUsecase>(
      () => GetAllProvincesUsecase(repository: sl.call()));
  sl.registerLazySingleton<PostProvinceUsecase>(
      () => PostProvinceUsecase(repository: sl.call()));

  // Register use cases
  sl.registerLazySingleton<GetAllByUserIdUsecase>(
      () => GetAllByUserIdUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetAllByEmployeeIdUsecase>(
      () => GetAllByEmployeeIdUsecase(repository: sl.call()));
  sl.registerLazySingleton<PostInquiryUsecase>(
      () => PostInquiryUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetAllByIdUsecase>(
      () => GetAllByIdUsecase(repository: sl.call()));

  //repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl.call()));

  sl.registerLazySingleton<BranchRepository>(
      () => BranchesRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<CityRepository>(
      () => CitiesRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<CrimeTypeRepository>(
      () => CrimeTypeRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<InstitutionsRepository>(
      () => InstitutionRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<ProvincesRepository>(
      () => ProvinceRepositoryImpl(remoteDataSource: sl.call()));

  sl.registerLazySingleton<InquiryRepository>(
      () => InquiryRepositoryImpl(remoteDataSource: sl.call()));

  //data source
  sl.registerLazySingleton<AuthEccmsRemoteDataSource>(
      () => AuthEccmsRemoteDataSourceImpl());
  sl.registerLazySingleton<OrganizationDataRemoteDataSource>(
      () => OrganizationDataRemoteDataSourceImpl());
  sl.registerLazySingleton<InquiryRemoteDataSource>(
      () => InquiryRemoteDataSourceImpl());

  //external
  // final auth = FirebaseAuth.instance;
  // final firestore = FirebaseFirestore.instance;

  // sl.registerLazySingleton(() => auth);
  // sl.registerLazySingleton(() => firestore);

  //sl.registerLazySingleton(() => firestore);
}
