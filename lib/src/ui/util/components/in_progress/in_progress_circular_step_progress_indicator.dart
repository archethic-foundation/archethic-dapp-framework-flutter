/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:archethic_dapp_framework_flutter/archethic-dapp-framework-flutter.dart';
import 'package:archethic_dapp_framework_flutter/src/domain/models/failures.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class InProgressCircularStepProgressIndicator extends StatelessWidget {
  const InProgressCircularStepProgressIndicator({
    required this.currentStep,
    required this.totalSteps,
    required this.isProcessInProgress,
    this.failure,
    super.key,
  });

  final int currentStep;
  final int totalSteps;
  final bool isProcessInProgress;
  final Failure? failure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Align(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularStepProgressIndicator(
              totalSteps: totalSteps,
              currentStep: currentStep,
              width: 35,
              height: 35,
              stepSize: 2,
              roundedCap: (_, isSelected) => isSelected,
              gradientColor: isProcessInProgress == false
                  ? failure == null
                      ? AppThemeBase
                          .gradientCircularStepProgressIndicatorFinished
                      : AppThemeBase.gradientCircularStepProgressIndicatorError
                  : failure == null
                      ? AppThemeBase.gradientCircularStepProgressIndicator
                      : AppThemeBase.gradientCircularStepProgressIndicatorError,
              selectedColor: Colors.white,
              unselectedColor: Colors.white.withOpacity(0.2),
              removeRoundedCapExtraAngle: true,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                if (isProcessInProgress && failure == null)
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      color: Colors.white.withOpacity(0.2),
                      strokeWidth: 1,
                    ),
                  ),
                const Icon(
                  Iconsax.timer,
                  size: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
