import 'package:connectivity_plus/connectivity_plus.dart';
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
    checkNetworkStatus();
  }

  Future<void> checkNetworkStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'No Internet Connection',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            content: Text(
              'Please check your internet connection.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            actions: [
              Container(
                alignment: Alignment.center,
                child: TextButton(
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          );
        },
      );
    } else {
      Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => SplashOneScreen(),
          ),
        ),
      );
    }
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
