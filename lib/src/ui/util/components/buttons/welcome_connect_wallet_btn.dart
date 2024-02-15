/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_dapp_framework_flutter/archethic-dapp-framework-flutter.dart'
    as aedappfm;
import 'package:archethic_dapp_framework_flutter/src/l10n/localizations-ae-dapp-framework.dart';
import 'package:flutter/material.dart';

class WelcomeConnectWalletBtn extends StatelessWidget {
  const WelcomeConnectWalletBtn({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return aedappfm.AppButton(
      labelBtn: AppLocalizations.of(context)!.aedappfm_connectionWalletConnect,
      onPressed: onPressed,
    );
  }
}
