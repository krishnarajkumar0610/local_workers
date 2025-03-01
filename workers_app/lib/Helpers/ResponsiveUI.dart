import 'package:flutter/material.dart';

class ResponsiveUIHelper {
  static late Size _uiSize;

  // Method to set the base UI size
  static void setUIBase({required Size uiSize}) {
    _uiSize = uiSize;
  }

  // Method to check if the device is a tablet
  static bool isTablet(BuildContext context) {
    var shortestSize = MediaQuery.of(context).size.shortestSide;
    return shortestSize >= 600;
  }

  // Private method to calculate responsive height
  static double _responsiveHeight(BuildContext context) {
    double baseHeight = isTablet(context) ? _uiSize.height * 1.5 : _uiSize.height;
    return MediaQuery.of(context).size.height / baseHeight;
  }

  // Private method to calculate responsive width
  static double _responsiveWidth(BuildContext context) {
    double baseWidth = isTablet(context) ? _uiSize.width * 1.5 : _uiSize.width;
    return MediaQuery.of(context).size.width / baseWidth;
  }

  static double _textScale(BuildContext context) =>
      (_responsiveHeight(context) + _responsiveWidth(context)) / 2;

  static _getHeight(num height, BuildContext context) {
    return MediaQuery.of(context).size.height * (height / _uiSize.height);
  }

  static _getWidth(num width, BuildContext context) {
    return MediaQuery.of(context).size.width * (width / _uiSize.width);
  }

  static double _radius(num r, BuildContext context) => r * _textScale(context);
  static double _getSp(num fontSize, BuildContext context) =>
      fontSize * _textScale(context);

  static SizedBox _verticalSpacing(num height, BuildContext context) =>
      SizedBox(
        height: _getHeight(height, context),
      );
  static SizedBox _horizontalSpacing(num width, BuildContext context) =>
      SizedBox(
        width: _getWidth(width, context),
      );

  static lh(int fontSize, num lineHeight) {
    return lineHeight / fontSize;
  }
}

extension ResponsizeUI on num {
  double h(BuildContext context) =>
      ResponsiveUIHelper._getHeight(this, context);
  double w(BuildContext context) => ResponsiveUIHelper._getWidth(this, context);
  double r(BuildContext context) => ResponsiveUIHelper._radius(this, context);
  double sp(BuildContext context) => ResponsiveUIHelper._getSp(this, context);
  double lh(int fontSize) => ResponsiveUIHelper.lh(fontSize, this);
}
