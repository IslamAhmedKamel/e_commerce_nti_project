import 'package:e_commerce_nti_project/core/observe.dart';
import 'package:e_commerce_nti_project/core/share.dart';
import 'package:e_commerce_nti_project/firebase_options.dart';
import 'package:e_commerce_nti_project/root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper.init();
  await GoogleSignIn.instance.initialize();
  Bloc.observer = Observe();
  runApp(const EcommereceApp());
}
