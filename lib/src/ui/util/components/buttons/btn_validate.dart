/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_dapp_framework_flutter/src/ui/util/components/buttons/app_button.dart';
import 'package:archethic_dapp_framework_flutter/src/ui/util/components/buttons/welcome_connect_wallet_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonValidate extends ConsumerWidget {
  const ButtonValidate({
    required this.controlOk,
    required this.labelBtn,
    required this.onPressed,
    required this.isConnected,
    required this.displayWalletConnectOnPressed,
    this.background = const Color(0xFF3D1D63),
    this.height = 40,
    this.fontSize = 16,
    this.displayWalletConnect = false,
    super.key,
  });

  final bool controlOk;
  final String labelBtn;
  final Function onPressed;
  final Color background;
  final double height;
  final double fontSize;
  final bool displayWalletConnect;
  final bool isConnected;
  final VoidCallback displayWalletConnectOnPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isConnected == false) {
      if (displayWalletConnect) {
        return WelcomeConnectWalletBtn(
          onPressed: displayWalletConnectOnPressed,
        );
      }
      return SizedBox(width: 10, height: height);
    }

    if (controlOk == false) {
      return AppButton(
        background: background,
        labelBtn: labelBtn,
        disabled: true,
        height: height,
        fontSize: fontSize,
      );
    }

    return AppButton(
      background: background,
      labelBtn: labelBtn,
      onPressed: onPressed,
      height: height,
      fontSize: fontSize,
    );
  }
}
