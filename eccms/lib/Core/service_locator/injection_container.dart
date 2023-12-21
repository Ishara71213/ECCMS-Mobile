import 'package:eccms/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:eccms/features/auth/presentation/bloc/user/cubit/user_cubit.dart';
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
      getCreateCurrentUserUsecase: sl.call(),
      getCurrentUIdUsecase: sl.call(),
      getCurrentUserByUidUsecase: sl.call()));

  // sl.registerFactory<ProfileCubit>(() => ProfileCubit(
  //     updateProfileDataUsecase: sl.call(),
  //     updateProfileImageUsecase: sl.call()));
  // sl.registerFactory<ViuserCubit>(() => ViuserCubit(
  //     getCurrentViUserById: sl.call(), getEmailByUidUsecase: sl.call()));
  // sl.registerFactory<GuardianCubit>(() => GuardianCubit(
  //     getCurrentGuardianUserById: sl.call(),
  //     getEmailByUidUsecase: sl.call(),
  //     liveLocationDataMonitotUsecase: sl.call()));

  // sl.registerFactory<VolunteerSupportCubit>(() => VolunteerSupportCubit(
  //     getAllRequestUsecase: sl.call(),
  //     submitRequestUsecase: sl.call(),
  //     getRequestByIdUsecase: sl.call(),
  //     deleteRequestUsecase: sl.call(),
  //     getCurrentUIdUsecase: sl.call(),
  //     acceptRequestByIdUsecase: sl.call(),
  //     rejectRequestByIdUsecase: sl.call(),
  //     getEmailByUidUseCae: sl.call(),
  //     uploadimageUsecase: sl.call()));

  //usecase

  //--auth usecases
  // sl.registerLazySingleton<SignInUsecase>(
  //     () => SignInUsecase(repository: sl.call()));
  // sl.registerLazySingleton<SignOutUsecase>(
  //     () => SignOutUsecase(repository: sl.call()));
  // sl.registerLazySingleton<SignUpUsecase>(
  //     () => SignUpUsecase(repository: sl.call()));
  // sl.registerLazySingleton<IsSignInUsecase>(
  //     () => IsSignInUsecase(repository: sl.call()));
  // sl.registerLazySingleton<GetCurrentUIdUsecase>(
  //     () => GetCurrentUIdUsecase(repository: sl.call()));
  // sl.registerLazySingleton<GetCreateCurrentUserUsecase>(
  //     () => GetCreateCurrentUserUsecase(repository: sl.call()));
  // sl.registerLazySingleton<GetCurrentUserByUidUsecase>(
  //     () => GetCurrentUserByUidUsecase(repository: sl.call()));

  //user info usecases
  // sl.registerLazySingleton<CreateCurrentViUserTypeInfo>(
  //     () => CreateCurrentViUserTypeInfo(repository: sl.call()));
  // sl.registerLazySingleton<CreateCurrentguardianUserTypeInfo>(
  //     () => CreateCurrentguardianUserTypeInfo(repository: sl.call()));
  // sl.registerLazySingleton<GetCurrentUIdGlobalUsecase>(
  //     () => GetCurrentUIdGlobalUsecase(repository: sl.call()));
  // sl.registerLazySingleton<GetUIdByEmailUsecase>(
  //     () => GetUIdByEmailUsecase(repository: sl.call()));
  // sl.registerLazySingleton<SetSpecificFieldByUserNameUsecase>(
  //     () => SetSpecificFieldByUserNameUsecase(repository: sl.call()));

  //App features usecases
  // sl.registerLazySingleton<UpdateProfileDataUsecase>(
  //     () => UpdateProfileDataUsecase(repository: sl.call()));
  // sl.registerLazySingleton<UpdateProfileImageUsecase>(
  //     () => UpdateProfileImageUsecase(repository: sl.call()));
  // sl.registerLazySingleton<GetCurrentViUserInfoByUidUsecase>(
  //     () => GetCurrentViUserInfoByUidUsecase(repository: sl.call()));
  // sl.registerLazySingleton<GetCurrentGuardianInfoByUidUsecase>(
  //     () => GetCurrentGuardianInfoByUidUsecase(repository: sl.call()));
  // sl.registerLazySingleton<GetEmailByUidUsecase>(
  //     () => GetEmailByUidUsecase(repository: sl.call()));

  // sl.registerLazySingleton<GetAllPostUsecase>(
  //     () => GetAllPostUsecase(repository: sl.call()));
  // sl.registerLazySingleton<SubmitPosteUsecase>(
  //     () => SubmitPosteUsecase(repository: sl.call()));
  // sl.registerLazySingleton<UploadimageUsecase>(
  //     () => UploadimageUsecase(repository: sl.call()));

  //repositories
  // sl.registerLazySingleton<FirebaseRepository>(
  //     () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));
  // sl.registerLazySingleton<UserInfoRepository>(
  //     () => UserInfoRepositoryImpl(remoteDataSource: sl.call()));
  // sl.registerLazySingleton<AppFeaturesRepository>(
  //     () => AppFeaturesRepositoryImpl(remoteDataSource: sl.call()));
  // sl.registerLazySingleton<ViUserProfileRepository>(
  //     () => ViUserProfileRepositoryImpl(remoteDataSource: sl.call()));
  // sl.registerLazySingleton<VolunteerSupportRepository>(
  //     () => VolunteerSupportRepositoryImpl(remoteDataSource: sl.call()));
  // sl.registerLazySingleton<GuardianUserProfileRepository>(
  //     () => GuardianUserProfileRepositoryImpl(remoteDataSource: sl.call()));

  //data source
  // sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
  //     FirebaseRemoteDataSourceImpl(auth: sl.call(), firestore: sl.call()));
  // sl.registerLazySingleton<UserInfoFirebaseRemoteDataSource>(() =>
  //     UserInfoFirebaseRemoteDataSourceImpl(
  //         auth: sl.call(), firestore: sl.call()));
  // sl.registerLazySingleton<AppFeaturesFirebaseRemoteDataSource>(() =>
  //     AppFeaturesFirebaseRemoteDataSourceImpl(
  //         auth: sl.call(), firestore: sl.call()));
  // sl.registerLazySingleton<ViProfileFirebaseRemoteDataSource>(() =>
  //     ViProfileFirebaseRemoteDataSourceImpl(
  //         auth: sl.call(), firestore: sl.call()));
  // sl.registerLazySingleton<GuardianProfileFirebaseRemoteDataSource>(() =>
  //     GuardianProfileFirebaseRemoteDataSourceImpl(
  //         auth: sl.call(), firestore: sl.call()));
  // sl.registerLazySingleton<VolunteerSupportRemoteDataSource>(() =>
  //     VolunteerSupportRemoteDataSourceImpl(
  //         auth: sl.call(), firestore: sl.call()));

  //external
  // final auth = FirebaseAuth.instance;
  // final firestore = FirebaseFirestore.instance;

  // sl.registerLazySingleton(() => auth);
  // sl.registerLazySingleton(() => firestore);
}
