import 'package:IllusionX/widgets/app_bar/custom_app_bar.dart';
import 'package:IllusionX/widgets/app_bar/appbar_leading_image.dart';
import 'package:IllusionX/widgets/app_bar/appbar_trailing_image.dart';
import 'package:IllusionX/widgets/custom_text_form_field.dart';
import 'package:IllusionX/widgets/custom_icon_button.dart';
import 'package:IllusionX/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:IllusionX/core/app_export.dart';
import 'notifier/chatbot_notifier.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatbotTwoScreen extends ConsumerStatefulWidget {
  const ChatbotTwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ChatbotTwoScreenState createState() => ChatbotTwoScreenState();
}

class ChatbotTwoScreenState extends ConsumerState<ChatbotTwoScreen> {
  Future<String> sendMessageToAPI(String message) async {
    final apiUrl = 'https://api.example.com/chatbot'; // Replace with FastAPI

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {'message': message},
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final reply = responseBody['reply'];
      return reply;
    } else {
      throw Exception('Failed to send message to API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 5.v),
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.h),
                child: Consumer(
                  builder: (context, ref, _) {
                    return CustomTextFormField(
                      controller: ref.watch(chatbotNotifier).menuController,
                      hintText: "msg_type_something".tr,
                      textInputAction: TextInputAction.done,
                      suffix: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 11.v, 11.h, 14.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgMenu,
                          height: 20.adaptSize,
                          width: 20.adaptSize,
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: 45.v,
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 19.h,
                        top: 14.v,
                        bottom: 14.v,
                      ),
                      borderDecoration: TextFormFieldStyleHelper.fillWhiteA,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildSixtyNine(context),
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
          onTapBtnHome(context);
        },
        margin: EdgeInsets.only(
          left: 21.h,
          top: 16.v,
          bottom: 16.v,
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgVuesaxLinearMessageText,
          onTap: () {
            onTapBtnchatlist(context);
          },
          margin: EdgeInsets.symmetric(
            horizontal: 19.h,
            vertical: 14.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSixtyNine(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.h,
        right: 21.h,
        bottom: 12.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 39.adaptSize,
            width: 39.adaptSize,
            padding: EdgeInsets.all(6.h),
            onTap: () {
              onTapBtnHome(context);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgHome,
            ),
          ),
          CustomElevatedButton(
            decoration: AppDecoration.outlineSecondaryContainer1
                .copyWith(borderRadius: BorderRadiusStyle.circleBorder11),
            width: 153.h,
            text: "lbl_chatbot".tr,
            margin: EdgeInsets.only(
              left: 24.h,
              top: 5.v,
              bottom: 3.v,
            ),
            leftIcon: Container(
              margin: EdgeInsets.only(right: 30.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgThumbsup,
                height: 20.v,
              ),
            ),
          ),
          Spacer(),
          CustomIconButton(
            height: 39.adaptSize,
            width: 39.adaptSize,
            padding: EdgeInsets.all(6.h),
            onTap: () {
              onTapBtnDevices(context);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgDevices,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.h),
            child: CustomIconButton(
              height: 39.adaptSize,
              width: 39.adaptSize,
              padding: EdgeInsets.all(4.h),
              onTap: () {
                onTapBtnSearch(context);
              },
              child: CustomImageView(
                imagePath: ImageConstant.imgSearch,
              ),
            ),
          ),
        ],
      ),
    );
  }

  onTapBtnHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }

  onTapBtnDevices(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.deviceScreen,
    );
  }

  onTapBtnSearch(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsScreen,
    );
  }

  onTapBtnchatlist(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.chatbotlistScreen,
    );
  }
}
