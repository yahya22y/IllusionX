import 'package:flutter/material.dart';
import 'dart:async';
import '../../core/app_export.dart';
import '../splash_one_screen/splash_one_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => SplashOneScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 56.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5.v),
              CustomImageView(
                imagePath: ImageConstant.imgXWhite1,
                height: 202.v,
                width: 277.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
