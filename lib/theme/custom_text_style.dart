import 'package:flutter/material.dart';
import 'package:yahya_s_application1/core/utils/size_utils.dart';
import 'package:yahya_s_application1/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeFuturaHvBTff000000 =>
      theme.textTheme.bodyLarge!.futuraHvBT.copyWith(
        color: Color(0XFF000000),
      );
  static get bodyLargeFuturaHvBTff4d4de9 =>
      theme.textTheme.bodyLarge!.futuraHvBT.copyWith(
        color: Color(0XFF4D4DE9),
      );
  static get bodyLargeMontserratBlack900 =>
      theme.textTheme.bodyLarge!.montserrat.copyWith(
        color: appTheme.black900,
      );
  static get bodyMediumMontserrat => theme.textTheme.bodyMedium!.montserrat;
  // Title text style
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyLargeFuturaHvBT => theme.textTheme.bodyLarge!.futuraHvBT;
  static get bodyLargeFuturaHvBTWhiteA700 =>
      theme.textTheme.bodyLarge!.futuraHvBT.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyLargeMontserratSecondaryContainer =>
      theme.textTheme.bodyLarge!.montserrat.copyWith(
        color: theme.colorScheme.secondaryContainer.withOpacity(1),
      );
  static get bodyLargeOnPrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodyLargeSecondaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.secondaryContainer.withOpacity(1),
      );
  static get bodyLargeWhiteA700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumFuturaHvBTGray50 =>
      theme.textTheme.bodyMedium!.futuraHvBT.copyWith(
        color: appTheme.gray50,
        fontSize: 15.fSize,
      );
  static get bodyMediumFuturaHvBTPrimary =>
      theme.textTheme.bodyMedium!.futuraHvBT.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 15.fSize,
      );
  static get bodyMediumFuturaMdBTWhiteA700 =>
      theme.textTheme.bodyMedium!.futuraMdBT.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodySmallOnPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  // Headline text style
  static get headlineLargeWhiteA700 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get headlineLargeWhiteA70032 =>
      theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 32.fSize,
      );
  // Title style
  static get titlelargeFuturaHvBT => theme.textTheme.titleLarge!.futuraHvBT;
  static get titlelargeFuturaHvBTWhiteA700 =>
      theme.textTheme.titleLarge!.futuraHvBT.copyWith(
        color: Color(0XFF4D4DE9),
      );
  static get titleLargeMontserratWhiteA700 =>
      theme.textTheme.titleLarge!.montserrat.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get futuraMdBT {
    return copyWith(
      fontFamily: 'Futura Md BT',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get futuraHvBT {
    return copyWith(
      fontFamily: 'Futura Hv BT',
    );
  }

  TextStyle get futuraLtBT {
    return copyWith(
      fontFamily: 'Futura Lt BT',
    );
  }
}
