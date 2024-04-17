import 'package:yahya_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:yahya_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:yahya_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:yahya_s_application1/widgets/custom_elevated_button.dart';
import 'package:yahya_s_application1/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:yahya_s_application1/core/app_export.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 16.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 6.h, right: 85.h),
                          child: Row(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgProfilePicture,
                                height: 115.v,
                                width: 124.h,
                                radius: BorderRadius.circular(25.h)),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 14.h, top: 45.v, bottom: 45.v),
                                child: Text("Peter Parker".tr,
                                    style: theme.textTheme.titleLarge))
                          ])),
                      SizedBox(height: 28.v),
                      _buildTwentyEight(context),
                      SizedBox(height: 37.v),
                      _buildAppSettings(context),
                      SizedBox(height: 37.v),
                      _buildAboutUs(context),
                      SizedBox(height: 37.v),
                      _buildContactUs(context),
                      SizedBox(height: 37.v),
                      _buildLogOut(context),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildTwentyThree(context)));
  }

  /// Section Widget APP BAR
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 45.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgVuesaxLinearArrowLeft,
            onTap: () {
              onTapBtnInbox(context);
            },
            margin: EdgeInsets.only(left: 21.h, top: 14.v, bottom: 17.v)),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_settings".tr));
  }

  Widget _buildTwentyEight(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_profile".tr,
        margin: EdgeInsets.only(left: 2.h),
        onPressed: () {
          onTapBtnprofile(context);
        },
        leftIcon: Container(
            margin: EdgeInsets.only(right: 40.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgSettings,
                height: 29.v,
                width: 25.h)));
  }

  /// Section Widget
  Widget _buildAppSettings(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_app_settings".tr,
        margin: EdgeInsets.only(left: 2.h),
        onPressed: (() {
          onTapAppSettings(context);
        }),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgSearch,
                height: 25.v,
                width: 25.h)));
  }

  /// Section Widget
  Widget _buildAboutUs(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_about_us".tr,
        margin: EdgeInsets.only(left: 2.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 45.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgInformation1,
                height: 35.v,
                width: 30.h)));
  }

  /// Section Widget
  Widget _buildContactUs(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_contact_us".tr,
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgProfile,
                height: 35.v,
                width: 18.h)));
  }

  /// Section Widget
  Widget _buildLogOut(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_log_out".tr,
        onPressed: () {
          onTapLogOut(context);
        },
        margin: EdgeInsets.only(left: 1.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgUser, height: 22.v, width: 19.h)));
  }

  /// Section Widget
  Widget _buildSettings(BuildContext context) {
    return CustomElevatedButton(
        height: 32.v,
        width: 153.h,
        text: "lbl_settings".tr,
        margin: EdgeInsets.only(top: 4.v, bottom: 3.v),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 24.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgSearchGray50,
                height: 26.v,
                width: 29.h)),
        buttonStyle: CustomButtonStyles.outlineBlackFTL11,
        buttonTextStyle: theme.textTheme.titleSmall!);
  }

  /// Section Widget
  Widget _buildTwentyThree(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 18.h, bottom: 12.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 39.adaptSize,
              width: 39.adaptSize,
              padding: EdgeInsets.all(6.h),
              onTap: () {
                onTapBtnHome(context);
              },
              child: CustomImageView(imagePath: ImageConstant.imgHome)),
          Padding(
              padding: EdgeInsets.only(left: 25.h),
              child: CustomIconButton(
                  height: 39.adaptSize,
                  width: 39.adaptSize,
                  padding: EdgeInsets.all(6.h),
                  onTap: () {
                    onTapBtnUser(context);
                  },
                  child: CustomImageView(imagePath: ImageConstant.imgUser))),
          Padding(
              padding: EdgeInsets.only(left: 25.h),
              child: CustomIconButton(
                  height: 39.adaptSize,
                  width: 39.adaptSize,
                  onTap: () {
                    onTapBtnInbox(context);
                  },
                  child: CustomImageView(imagePath: ImageConstant.imgDevices))),
          Spacer(),
          _buildSettings(context)
        ]));
  }

  onTapTwentyEight(BuildContext context) {
    // TODO: implement Actions
  }

  onTapAppSettings(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.appSettigsScreen);
  }

  onTapLogOut(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }

  onTapBtnHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }

  onTapBtnUser(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.chatbotScreen,
    );
  }

  onTapBtnInbox(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.deviceScreen,
    );
  }

  onTapBtnprofile(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.profileScreen,
    );
  }
}
