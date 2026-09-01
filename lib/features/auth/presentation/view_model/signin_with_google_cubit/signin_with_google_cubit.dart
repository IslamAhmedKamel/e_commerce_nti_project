import 'dart:developer';

import 'package:e_commerce_nti_project/core/share.dart';
import 'package:e_commerce_nti_project/core/utils/constant_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'signin_with_google_state.dart';

class SigninWithGoogleCubit extends Cubit<SigninWithGoogleState> {
  SigninWithGoogleCubit() : super(SigninWithGoogleInitial());

  Future<void> signinWithGoogle() async {
    try {
      emit(SigninWithGoogleLoading());

      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
          .authenticate();
      if (googleUser == null) {
        return;
      }
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(SigninWithGoogleSuccess());
      CacheHelper.saveData(key: AppConstant.islogin, value: true);
    } catch (e) {
      log('Google Sign In Error: $e');
      emit(SigninWithGoogleFailure());
    }
  }
}
