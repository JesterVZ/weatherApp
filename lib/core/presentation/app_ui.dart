import 'package:flutter/material.dart';

abstract class AppUI {
  static const _paddingZero = 0.0;
  static const _paddingXS = 8.0;
  static const _paddingS = 12.0;
  static const _padding = 16.0;
  static const _paddingLs = 24.0;
  static const _paddingL = 32.0;
  static const _paddingXL = 33.0;

  static const contentHorizontalSpacing = SizedBox(width: _padding);
  static const contentHorizontalSpacingSmall = SizedBox(width: _paddingS);
  static const contentHorizontalSpacingExtraSmall = SizedBox(width: _paddingXS);
  static const contentVerticalSpacing = SizedBox(height: _paddingLs);
  static const contentVerticalSpacingExtraSmall = SizedBox(height: _paddingXS);

  static const contentPadding = EdgeInsets.only(left: 24, right: 24, top: 48);

  static BorderRadius borderRadius1 = BorderRadius.circular(8);
  static BorderRadius borderRadius2 = BorderRadius.circular(24);

  static appScaffold(Color backgroundColor, Widget body) => Scaffold(
        backgroundColor: backgroundColor,
        body: body,
      );
}
