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

    final GoogleSignInAccount? googleUser =
        await GoogleSignIn.instance.authenticate();

    if (googleUser == null) {
      emit(SigninWithGoogleFailure());
      return;
    }

    final GoogleSignInAuthentication googleAuth =
        googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    emit(SigninWithGoogleSuccess());
  } catch (e) {
    print('Google Sign In Error: $e');
    emit(SigninWithGoogleFailure());
  }
}



}


