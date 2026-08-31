import 'package:e_commerce_nti_project/core/utils/app_router.dart';
import 'package:e_commerce_nti_project/core/utils/constant_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EcommereceApp extends StatelessWidget {
  const EcommereceApp({super.key});

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: AppConstant.primFamilyFont,
            scaffoldBackgroundColor: Color(0xffF9F9F9),
          ),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
