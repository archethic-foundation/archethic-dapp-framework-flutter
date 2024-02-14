import 'package:archethic_dapp_framework_flutter/archethic-dapp-framework-flutter.dart'
    as aedappfm;
import 'package:archethic_dapp_framework_flutter/src/domain/models/failures.dart';
import 'package:flutter/material.dart';

class InProgressInfosBanner extends StatelessWidget {
  const InProgressInfosBanner({
    required this.isProcessInProgress,
    required this.walletConfirmation,
    required this.walletConfirmationTxt,
    required this.successTxt,
    required this.inProgressTxt,
    this.failure,
    this.failureMessage,
    super.key,
  });

  final bool isProcessInProgress;
  final bool walletConfirmation;
  final Failure? failure;
  final String walletConfirmationTxt;
  final String successTxt;
  final String inProgressTxt;
  final String? failureMessage;

  @override
  Widget build(BuildContext context) {
    if (failure != null && failureMessage != null) {
      return aedappfm.InfoBanner(
        failureMessage!,
        aedappfm.InfoBannerType.error,
        width: MediaQuery.of(context).size.width * 0.9,
      );
    }

    if (walletConfirmation == true) {
      return aedappfm.InfoBanner(
        walletConfirmationTxt,
        aedappfm.InfoBannerType.request,
        width: MediaQuery.of(context).size.width * 0.9,
      );
    }

    if (failure == null && isProcessInProgress == false) {
      return aedappfm.InfoBanner(
        successTxt,
        aedappfm.InfoBannerType.success,
        width: MediaQuery.of(context).size.width * 0.9,
      );
    }

    return aedappfm.InfoBanner(
      inProgressTxt,
      aedappfm.InfoBannerType.request,
      width: MediaQuery.of(context).size.width * 0.9,
      waitAnimation: true,
    );
  }
}
