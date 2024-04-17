import 'package:yahya_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:yahya_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:yahya_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:yahya_s_application1/core/utils/validation_functions.dart';
import 'package:yahya_s_application1/widgets/custom_text_form_field.dart';
import 'package:yahya_s_application1/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:yahya_s_application1/core/app_export.dart';
import 'notifier/forget_notifier.dart';

class ForgetScreen extends ConsumerStatefulWidget {
  const ForgetScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ForgetScreenState createState() => ForgetScreenState();
}

class ForgetScreenState extends ConsumerState<ForgetScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
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
                  horizontal: 25.h,
                  vertical: 34.v,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: Text(
                          "lbl_enter_email".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.v),
                    Consumer(
                      builder: (context, ref, _) {
                        return CustomTextFormField(
                          controller: ref.watch(forgetNotifier).emailController,
                          hintText: "lbl_your_email2".tr,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value, isRequired: true))) {
                              return "err_msg_please_enter_valid_email".tr;
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    SizedBox(height: 33.v),
                    CustomElevatedButton(
                      width: 220.h,
                      text: "lbl_get_otp".tr,
                      onPressed: (() {
                        onTapBtnHome(context);
                      }),
                    ),
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
          onTapLogOut(context);
        },
        margin: EdgeInsets.only(
          left: 21.h,
          top: 14.v,
          bottom: 17.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_forget_password".tr,
      ),
    );
  }

  onTapBtnHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }

  onTapLogOut(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
