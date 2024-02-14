/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_dapp_framework_flutter/archethic-dapp-framework-flutter.dart';
import 'package:archethic_dapp_framework_flutter/src/domain/models/failures.dart';
import 'package:archethic_dapp_framework_flutter/src/ui/util/components/buttons/app_button.dart';
import 'package:flutter/material.dart';

class DexInProgressResumeBtn extends StatelessWidget {
  const DexInProgressResumeBtn({
    required this.isProcessInProgress,
    required this.currentStep,
    required this.onPressed,
    this.failure,
    super.key,
  });

  final bool isProcessInProgress;
  final int currentStep;
  final VoidCallback onPressed;
  final Failure? failure;

  @override
  Widget build(BuildContext context) {
    if (isProcessInProgress == false && failure != null && currentStep > 0) {
      return AppButton(
        labelBtn: AppLocalizations.of(context)!.aedappfm_btn_resume,
        onPressed: onPressed,
      );
    }
    return const SizedBox.shrink();
  }
}
