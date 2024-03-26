import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static double fontSizeFromTextStyle(
    BuildContext context,
    TextStyle textStyle,
  ) {
    if (Responsive.isDesktop(context)) {
      return textStyle.fontSize!;
    } else {
      if (Responsive.isTablet(context)) {
        return textStyle.fontSize! - 2;
      }
    }
    return textStyle.fontSize! - 4;
  }

  static double fontSizeFromValue(
    BuildContext context, {
    required double desktopValue,
    double ratioTablet = 2,
    double ratioMobile = 4,
  }) {
    if (Responsive.isDesktop(context)) {
      return desktopValue;
    } else {
      if (Responsive.isTablet(context)) {
        return desktopValue - ratioTablet;
      }
    }
    return desktopValue - ratioMobile;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        } else if (constraints.maxWidth >= 650) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
