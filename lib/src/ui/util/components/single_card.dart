/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:ui';

import 'package:archethic_dapp_framework_flutter/src/ui/themes/app_theme_base.dart';
import 'package:flutter/material.dart';

class SingleCard extends StatelessWidget {
  const SingleCard({
    required this.cardContent,
    this.globalPadding = 20,
    super.key,
  });

  final Widget cardContent;
  final double globalPadding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppThemeBase.sheetBackground,
            border: Border.all(
              color: AppThemeBase.sheetBorder,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(globalPadding),
            child: cardContent,
          ),
        ),
      ),
    );
  }
}
