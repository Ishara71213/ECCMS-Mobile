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
import 'package:eccms/features/inquiry/presentation/bloc/inquiry/cubit/inquiry_cubit.dart';
import 'package:eccms/features/organization/data/data_sources/remote/organization_data/organization_data_remote_data_source.dart';
import 'package:eccms/features/organization/data/data_sources/remote/organization_data/organization_data_remote_data_source_impl.dart';
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

  sl.registerFactory<InquiryCubit>(() => InquiryCubit());

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

  //repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl.call()));

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
