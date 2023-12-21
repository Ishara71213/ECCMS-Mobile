import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:eccms/features/auth/domain/usecases/get_current_uid_usecase.dart';
import 'package:eccms/features/auth/domain/usecases/is_sign_in_usecase.dart';
import 'package:eccms/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetCurrentUIdUsecase getCurrentUIdUsecase;
  final IsSignInUsecase isSignInUsecase;
  final SignOutUsecase signOutUsecase;

  AuthCubit(
      {required this.getCurrentUIdUsecase,
      required this.isSignInUsecase,
      required this.signOutUsecase})
      : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      final isSignIn = await isSignInUsecase.call();
      if (isSignIn) {
        final uid = await getCurrentUIdUsecase.call();
        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    } catch (e) {
      print(e.toString());

      emit(UnAuthenticated());
    }
  }

  Future<void> signIn() async {
    try {
      final uid = await getCurrentUIdUsecase.call();
      emit(Authenticated(uid: uid));
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    }
  }

  // Future<void> signInWithGoogle() async {
  //   try {
  //     GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //     AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
  //     UserCredential user =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //     final uid = await getCurrentUIdUsecase.call();
  //     emit(Authenticated(uid: uid));
  //   } on SocketException catch (_) {
  //     emit(UnAuthenticated());
  //   }
  // }

  Future<void> signOut() async {
    try {
      imageCache?.clear();
      imageCache.clearLiveImages();
      imageCache.containsKey('profileimage');
      DefaultCacheManager().emptyCache();
      await signOutUsecase.call();
      emit(UnAuthenticated());
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    }
  }
}
