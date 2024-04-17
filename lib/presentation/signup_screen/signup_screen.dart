import 'package:yahya_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:yahya_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:yahya_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:yahya_s_application1/core/utils/validation_functions.dart';
import 'package:yahya_s_application1/widgets/custom_text_form_field.dart';
import 'package:yahya_s_application1/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:yahya_s_application1/core/app_export.dart';
import 'notifier/signup_notifier.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends ConsumerState<SignupScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 22.h,
                  vertical: 48.v,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.h),
                        child: Text(
                          "msg_enter_first_name".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.v),
                    _buildFirstName(context),
                    SizedBox(height: 33.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Text(
                          "lbl_enter_last_name".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.v),
                    _buildLastName(context),
                    SizedBox(height: 33.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Text(
                          "lbl_enter_email".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.v),
                    _buildEmail(context),
                    SizedBox(height: 33.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Text(
                          "lbl_enter_password".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.v),
                    _buildPassword(context),
                    SizedBox(height: 33.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 7.h),
                        child: Text(
                          "msg_confirm_password".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.v),
                    _buildConfirmpassword(context),
                    SizedBox(height: 50.v),
                    _buildSignUp(context),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgVuesaxLinearArrowLeft,
        onTap: () {
          ontapbtnarrow(context);
        },
        margin: EdgeInsets.only(
          left: 21.h,
          top: 14.v,
          bottom: 17.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_sign_up".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 1.h,
        right: 5.h,
      ),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            controller: ref.watch(signupNotifier).firstNameController,
            hintText: "lbl_first_name".tr,
            hintStyle: CustomTextStyles.bodyMediumMontserrat,
            validator: (value) {
              if (!isText(value)) {
                return "err_msg_please_enter_valid_text".tr;
              }
              return null;
            },
            borderDecoration: TextFormFieldStyleHelper.fillOnPrimary,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2.h,
        right: 4.h,
      ),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            controller: ref.watch(signupNotifier).lastNameController,
            hintText: "lbl_last_name".tr,
            validator: (value) {
              if (!isText(value)) {
                return "err_msg_please_enter_valid_text".tr;
              }
              return null;
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            controller: ref.watch(signupNotifier).emailController,
            hintText: "lbl_email".tr,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "err_msg_please_enter_valid_email".tr;
              }
              return null;
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5.h),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            controller: ref.watch(signupNotifier).passwordController,
            hintText: "lbl_password".tr,
            textInputType: TextInputType.visiblePassword,
            suffix: InkWell(
              onTap: () {
                ref.read(signupNotifier.notifier).changePasswordVisibility();
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 11.v, 10.h, 11.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgEye,
                  height: 20.v,
                ),
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 45.v,
            ),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: ref.watch(signupNotifier).isShowPassword,
            contentPadding: EdgeInsets.only(
              left: 16.h,
              top: 14.v,
              bottom: 14.v,
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 3.h,
        right: 2.h,
      ),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            controller: ref.watch(signupNotifier).confirmpasswordController,
            hintText: "msg_confirm_password2".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            suffix: InkWell(
              onTap: () {
                ref.read(signupNotifier.notifier).changePasswordVisibility1();
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 11.v, 10.h, 11.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgEye,
                  height: 20.v,
                ),
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 45.v,
            ),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: ref.watch(signupNotifier).isShowPassword1,
            contentPadding: EdgeInsets.only(
              left: 15.h,
              top: 14.v,
              bottom: 14.v,
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
      width: 220.h,
      text: "lbl_sign_up".tr,
      buttonStyle: CustomButtonStyles.outlineBlackTL15,
      onPressed: () {
        onTapBtnHome(context);
      },
    );
  }

  onTapBtnHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }

  ontapbtnarrow(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
