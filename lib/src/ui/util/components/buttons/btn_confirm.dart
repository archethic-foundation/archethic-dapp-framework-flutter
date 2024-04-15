/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_dapp_framework_flutter/src/ui/util/components/buttons/app_button.dart';
import 'package:flutter/material.dart';

class ButtonConfirm extends StatelessWidget {
  const ButtonConfirm({
    required this.labelBtn,
    required this.onPressed,
    this.background = const Color(0xFF3D1D63),
    this.disabled = false,
    super.key,
  });

  final String labelBtn;
  final Function onPressed;
  final Color background;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      background: background,
      labelBtn: labelBtn,
      onPressed: onPressed,
      disabled: disabled,
    );
  }
}
