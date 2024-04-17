import 'package:yahya_s_application1/core/utils/validation_functions.dart';
import 'package:yahya_s_application1/widgets/custom_text_form_field.dart';
import 'package:yahya_s_application1/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:yahya_s_application1/core/app_export.dart';
import 'notifier/login_notifier.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

// ignore_for_file: must_be_immutable
class LoginScreenState extends ConsumerState<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Form(
                            key: _formKey,
                            child: Container(
                                width: double.maxFinite,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.h, vertical: 45.v),
                                child: Column(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgX1,
                                      height: 97.v),
                                  SizedBox(height: 17.v),
                                  Text("lbl_login".tr,
                                      style: theme.textTheme.headlineLarge),
                                  SizedBox(height: 39.v),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 2.h),
                                          child: Text("lbl_enter_email".tr,
                                              style:
                                                  theme.textTheme.bodyLarge))),
                                  SizedBox(height: 4.v),
                                  Consumer(builder: (context, ref, _) {
                                    return CustomTextFormField(
                                        controller: ref
                                            .watch(loginNotifier)
                                            .emailController,
                                        hintText: "lbl_your_email".tr,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value == null ||
                                              (!isValidEmail(value,
                                                  isRequired: true))) {
                                            return "err_msg_please_enter_valid_email"
                                                .tr;
                                          }
                                          return null;
                                        },
                                        borderDecoration:
                                            TextFormFieldStyleHelper
                                                .outlineBlack);
                                  }),
                                  SizedBox(height: 34.v),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 2.h),
                                          child: Text("lbl_enter_password".tr,
                                              style:
                                                  theme.textTheme.bodyLarge))),
                                  SizedBox(height: 4.v),
                                  Consumer(builder: (context, ref, _) {
                                    return CustomTextFormField(
                                        controller: ref
                                            .watch(loginNotifier)
                                            .passwordController,
                                        hintText: "msg_your_password".tr,
                                        textInputAction: TextInputAction.done,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        suffix: InkWell(
                                            onTap: () {
                                              ref
                                                  .read(loginNotifier.notifier)
                                                  .changePasswordVisibility();
                                            },
                                            child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    30.h, 12.v, 12.h, 12.v),
                                                child: CustomImageView(
                                                    imagePath:
                                                        ImageConstant.imgEye,
                                                    height: 21.v))),
                                        suffixConstraints:
                                            BoxConstraints(maxHeight: 45.v),
                                        validator: (value) {
                                          if (value == null ||
                                              (!isValidPassword(value,
                                                  isRequired: true))) {
                                            return "err_msg_please_enter_valid_password"
                                                .tr;
                                          }
                                          return null;
                                        },
                                        obscureText: ref
                                            .watch(loginNotifier)
                                            .isShowPassword,
                                        contentPadding: EdgeInsets.only(
                                            left: 13.h,
                                            top: 14.v,
                                            bottom: 14.v),
                                        borderDecoration:
                                            TextFormFieldStyleHelper
                                                .outlineBlack);
                                  }),
                                  SizedBox(height: 6.v),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        onTapBtnforget(context);
                                      },
                                      child: Text(
                                        "msg_forget_password".tr,
                                        style: theme.textTheme.bodyLarge,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 94.v),
                                  CustomElevatedButton(
                                      onPressed: (() {
                                        onTapBtnHome(context);
                                      }),
                                      width: 219.h,
                                      text: "lbl_login".tr),
                                  Spacer(),
                                  SizedBox(height: 5.v),
                                  GestureDetector(
                                      onTap: () {
                                        onTapTxtDonthaveanaccount(context);
                                      },
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "msg_don_t_have_an_account2"
                                                        .tr,
                                                style: CustomTextStyles
                                                    .bodyLargeFuturaHvBTff4d4de9),
                                            TextSpan(text: "  ".tr),
                                            TextSpan(
                                                text: "lbl_sign_up".tr,
                                                style: CustomTextStyles
                                                    .bodyLargeFuturaHvBTff000000
                                                    .copyWith(
                                                        decoration:
                                                            TextDecoration
                                                                .underline))
                                          ]),
                                          textAlign: TextAlign.left))
                                ]))))))));
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }

  onTapBtnHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }

  onTapBtnforget(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.forgetScreen,
    );
  }
}
