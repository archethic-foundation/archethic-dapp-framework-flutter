/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_dapp_framework_flutter/src/ui/themes/app_theme_base.dart';
import 'package:archethic_dapp_framework_flutter/src/ui/util/dimens.dart';
import 'package:archethic_dapp_framework_flutter/src/ui/util/generic/responsive.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.labelBtn,
    this.onPressed,
    this.height = 40,
    this.disabled = false,
    this.background = const Color(0xFF3D1D63),
    this.fontSize = 16,
    this.dimens = Dimens.buttonDimens,
  });
  final String labelBtn;
  final Function? onPressed;
  final bool disabled;
  final double height;
  final Color background;
  final double fontSize;
  final List<double> dimens;

  @override
  AppButtonState createState() => AppButtonState();
}

class AppButtonState extends State<AppButton> {
  bool _over = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _over = true;
        });
      },
      onExit: (_) {
        setState(() {
          _over = false;
        });
      },
      child: _buttonContent(),
    );
  }

  Widget _buttonContent() {
    return Container(
      alignment: Alignment.center,
      height: widget.height,
      decoration: ShapeDecoration(
        gradient: AppThemeBase.gradientBtn,
        shape: const StadiumBorder(),
      ),
      margin: EdgeInsetsDirectional.fromSTEB(
        widget.dimens[0],
        widget.dimens[1],
        widget.dimens[2],
        widget.dimens[3],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          if (widget.disabled == false) {
            widget.onPressed!();
          }
        },
        child: SizedBox(
          height: widget.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                widget.labelBtn,
                textAlign: TextAlign.center,
                stepGranularity: 0.5,
                style: TextStyle(
                  color: widget.disabled
                      ? ArchethicThemeBase.neutral0.withOpacity(0.3)
                      : ArchethicThemeBase.neutral0,
                  fontSize: Responsive.fontSizeFromValue(
                    context,
                    desktopValue: widget.fontSize,
                    ratioMobile: 1,
                    ratioTablet: 1,
                  ),
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    ).animate(target: _over ? 0 : 1).fade(end: 0.8);
  }
}
