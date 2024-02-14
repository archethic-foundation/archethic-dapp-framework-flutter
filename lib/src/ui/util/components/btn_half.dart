/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_dapp_framework_flutter/src/ui/themes/app_theme_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class ButtonHalf extends StatelessWidget {
  const ButtonHalf({
    super.key,
    required this.balanceAmount,
    required this.onTap,
  });

  final double balanceAmount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (balanceAmount <= 0) {
      return const SizedBox.shrink();
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppThemeBase.halfButtonColor),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            AppLocalizations.of(context)!.btn_half,
            style: TextStyle(color: AppThemeBase.halfButtonColor),
          ),
        ),
      )
          .animate()
          .fade(
            duration: const Duration(milliseconds: 300),
          )
          .scale(
            duration: const Duration(milliseconds: 300),
          ),
    );
  }
}
